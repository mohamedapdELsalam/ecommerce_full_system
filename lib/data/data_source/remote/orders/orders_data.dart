import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/core/constants/apiLink.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:get/get.dart';

class OrdersData {
  Crud crud = Get.find();
  MyServices myServices = Get.find();

  getPendingOrders() async {
    var response = await crud.postRequest(ApiLinks.pendingOrders,
        {"userId": myServices.sharedPref.getInt("user_id").toString()});

    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }

  getArchiveOrders() async {
    var response = await crud.postRequest(ApiLinks.archiveOrders,
        {"userId": myServices.sharedPref.getInt("user_id").toString()});

    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }

  deleteOrderRequest(int orderId) async {
    var response = await crud
        .postRequest(ApiLinks.deleteOrder, {"orderId": orderId.toString()});

    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }

  ratingOrder(int orderId, double rating, String note) async {
    var response = await crud.postRequest(ApiLinks.ratingOrder, {
      "orderId": orderId.toString(),
      "rating": rating.toString(),
      "note": note
    });

    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }
}
