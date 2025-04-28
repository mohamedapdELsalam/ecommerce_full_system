import 'package:adminapp/core/class/status_request.dart';
import 'package:adminapp/core/functions/handling_status_request.dart';
import 'package:adminapp/data/data_source/remote/orders/orders_data.dart';
import 'package:adminapp/data/model/order_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OrdersControllerAbstract extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  double? orderRating;
  TextEditingController commentCtrl = TextEditingController();
  OrdersData ordersData = OrdersData();
  List<OrderModel> allOrders = [];
  List<OrderModel> pendingOrders = [];
  List<OrderModel> archiveOrders = [];
  List<OrderModel> acceptedOrders = [];
  RxInt pendingCounter = 0.obs;
  RxInt acceptedCounter = 0.obs;
  Future<void> getPendingOrders();
  Future<void> getArchiveOrders();
  Future<void> getAcceptedOrders();
  Future<void> getAllOrders();
  String printOrderStatus(int val);
  refreshOrders();
  takeOrder(int? orderId, int adminId, int userId);
  doneOrder(int? orderId, int adminId, int userId);
}

class OrdersController extends OrdersControllerAbstract {
  @override
  void onInit() async {
    super.onInit();
    // await getPendingOrders();
    // await getArchiveOrders();
    // await getAcceptedOrders();
    await getAllOrders();
  }

  @override
  refreshOrders() async {
    // await getPendingOrders();
    // await getAcceptedOrders();
    await getAllOrders();
  }

  @override
  getAllOrders() async {
    allOrders.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.getAllOrders();
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        List data = response["data"];
        allOrders.addAll(data.map((e) => OrderModel.fromJson(e)));
        //  pendingCounter.value = pendingOrders.length;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
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
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  getAcceptedOrders() async {
    acceptedOrders.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.getAcceptedOrders();
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        List data = response["data"];
        acceptedOrders.addAll(data.map((e) => OrderModel.fromJson(e)));
        acceptedCounter.value = acceptedOrders.length;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  getArchiveOrders() async {
    archiveOrders.clear();
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
  takeOrder(orderId, adminId, userId) async {
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
        Get.snackbar("Lets'go", "you have taken this order ");
        getPendingOrders();
        getAcceptedOrders();
      } else {
        Get.snackbar("error", "there is a problem");
      }
    } else {
      Get.snackbar("exiption error", "oooh!");
    }
    update();
  }

  @override
  doneOrder(orderId, adminId, userId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.doneOrder(
      orderId: orderId,
      adminId: adminId,
      userId: userId,
    );
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        Get.snackbar("Done", "Well Done");
        getAcceptedOrders();
        acceptedCounter.value--;
      } else {
        Get.snackbar("error", "there is a problem");
      }
    } else {
      Get.snackbar("exiption error", "oooh!");
    }
    update();
  }
}
