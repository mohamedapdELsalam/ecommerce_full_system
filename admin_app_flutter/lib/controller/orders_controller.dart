import 'package:adminapp/core/class/status_request.dart';
import 'package:adminapp/core/functions/handling_status_request.dart';
import 'package:adminapp/data/data_source/remote/orders/orders_data.dart';
import 'package:adminapp/data/model/order_model.dart';
import 'package:adminapp/view/screens/orders/archives_orders.dart';
import 'package:adminapp/view/screens/orders/orders_accepted.dart';
import 'package:adminapp/view/screens/orders/pending_orders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OrdersControllerAbstract extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  double? orderRating;
  TextEditingController commentCtrl = TextEditingController();
  OrdersData ordersData = OrdersData();
  List<OrderModel> pendingOrders = [];
  List<OrderModel> acceptedOrders = [];
  void getPendingOrders();
  void getAcceptedOrders();

  String printOrderStatus(int val);
  refreshOrders();
  changePage(int index) {}
  RxInt currentIndex = 0.obs;
}

class OrdersController extends OrdersControllerAbstract {
  List<Widget> ordersPages = [
    const PendingOrdersScreen(),
    const AcceptedOrders(),
    const OrdersArchive(),
  ];

  @override
  void onInit() async {
    super.onInit();

    getPendingOrders();
    getAcceptedOrders();
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
  void getAcceptedOrders() async {
    acceptedOrders.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.getAcceptedOrders();
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        List data = response["data"];
        acceptedOrders.addAll(data.map((e) => OrderModel.fromJson(e)));
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  changePage(int index) {
    currentIndex.value = index;
    update();
  }

  @override
  refreshOrders() async {}

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
}
