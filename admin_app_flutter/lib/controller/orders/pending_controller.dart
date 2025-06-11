import 'package:adminapp/controller/orders/accepted_controller.dart';
import 'package:adminapp/core/class/status_request.dart';
import 'package:adminapp/core/functions/handling_status_request.dart';
import 'package:adminapp/data/data_source/remote/orders/orders_data.dart';
import 'package:adminapp/data/model/order_model.dart';
import 'package:get/get.dart';

abstract class PendingOrdersControllerAbstract extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  OrdersData ordersData = OrdersData();
  List<OrderModel> pendingOrders = [];

  RxInt pendingCounter = 0.obs;
  RxInt acceptedCounter = 0.obs;
  Future<void> getPendingOrders();

  String printOrderStatus(int val);
  refreshOrders();
  approveOrder({int? orderId, int adminId, int userId});
}

class PendingOrdersController extends PendingOrdersControllerAbstract {
  @override
  void onInit() async {
    super.onInit();
    await getPendingOrders();
  }

  @override
  refreshOrders() async {
    await getPendingOrders();
  }

  @override
  getPendingOrders() async {
    pendingOrders.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.getPendingOrders();
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        List data = response["data"];
        pendingOrders.addAll(data.map((e) => OrderModel.fromJson(e)));
        pendingCounter.value = pendingOrders.length;
        if (pendingCounter.value == 0) {
          statusRequest = StatusRequest.failure;
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {}
    update();
  }

  @override
  String printOrderStatus(val) {
    if (val == 0) {
      return "pending await";
    } else if (val == 1) {
      return "approved";
    } else if (val == 2) {
      return "prepared";
    } else if (val == 3) {
      return "on the way";
    }
    return "archived";
  }

  void resetStatus() {
    statusRequest = StatusRequest.none;
    update();
  }

  @override
  approveOrder({int? orderId, int? adminId, int? userId}) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.approveOrder(
      orderId: orderId,
      adminId: adminId,
      userId: userId,
    );
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        Get.snackbar("done", "the order has been approved successfully");
        getPendingOrders();
        pendingCounter.value--;
        AcceptedOrdersController acceptController = Get.find();
        acceptController.getAcceptedOrders();
      } else {
        Get.snackbar("error", "there is a problem");
      }
    } else {
      Get.snackbar("exiption error", "oooh!");
    }
    update();
  }
}
