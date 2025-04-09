import 'package:ecommerceapp/core/class/status_request.dart';
import 'package:ecommerceapp/core/functions/handlindStatusRequest.dart';
import 'package:ecommerceapp/data/data_source/remote/orders/orders_data.dart';
import 'package:ecommerceapp/data/model/order_model.dart';
import 'package:get/get.dart';

abstract class OrdersControllerAbstract extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  OrdersData ordersData = OrdersData();
  List<OrderModel> pendingOrders = [];
  List<OrderModel> archiveOrders = [];
  void getPendingOrders();
  void getArchiveOrders();
  String printOrderStatus(int val);
  void refreshOrders();
  void deleteOrder({int? orderId, int? orderStatus});
}

class OrdersController extends OrdersControllerAbstract {
  @override
  void onInit() {
    super.onInit();
    getPendingOrders();
    getArchiveOrders();
  }

  @override
  void getPendingOrders() async {
    pendingOrders.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.getPendingOrders();
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        List data = response["data"];
        pendingOrders.addAll(data.map((e) => OrderModel.fromJson(e)));
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  void getArchiveOrders() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.getArchiveOrders();
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        List data = response["data"];
        archiveOrders.addAll(data.map((e) => OrderModel.fromJson(e)));
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  void deleteOrder({int? orderId, int? orderStatus}) async {
    if (orderStatus == 0) {
      pendingOrders.removeWhere((e) => e.ordersId == orderId);
    }
    update();
    var response = await ordersData.deleteOrderRequest(orderId!);
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        Get.showSnackbar(GetSnackBar(
          title: "done",
          message: "order deleted successfully",
        ));
      } else {
        statusRequest = StatusRequest.success;

        Get.showSnackbar(GetSnackBar(
          title: "fail",
          message: "order not deleted ",
        ));
      }
    }
    update();
  }

  @override
  String printOrderStatus(val) {
    if (val == 0) {
      return "pending await";
    } else if (val == 1) {
      return "approved";
    }
    return "archived";
  }

  @override
  void refreshOrders() {
    getPendingOrders();
  }

  void resetStatus() {
    statusRequest = StatusRequest.none;
    update();
  }
}
