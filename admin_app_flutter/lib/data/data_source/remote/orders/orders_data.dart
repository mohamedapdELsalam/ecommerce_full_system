import 'package:adminapp/core/class/crud.dart';
import 'package:adminapp/core/constants/api_links.dart';
import 'package:adminapp/core/services/services.dart';
import 'package:get/get.dart';

class OrdersData {
  Crud crud = Get.find();
  MyServices myServices = Get.find();

  getAllOrders() async {
    var response = await crud.getRequest(ApiLinks.viewOrders);
    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }

  getPendingOrders() async {
    var response = await crud.postRequest(ApiLinks.pendingOrders, {
      "userId": myServices.sharedPref.getInt("user_id").toString(),
    });

    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }

  getAcceptedOrders() async {
    var response = await crud.getRequest(ApiLinks.acceptedOrders);

    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }

  getArchiveOrders() async {
    var response = await crud.getRequest(ApiLinks.archiveOrders);

    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }

  approveOrder({int? orderId, int? adminId, int? userId}) async {
    var response = await crud.postRequest(ApiLinks.approveOrder, {
      "userId": userId.toString(),
      "courierId": myServices.sharedPref.getInt("courier_id").toString(),
      "orderId": orderId.toString(),
      "adminId": adminId.toString(),
    });

    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }

  prepareOrder({
    int? orderId,
    int? adminId,
    int? userId,
    int? deliveryType,
  }) async {
    var response = await crud.postRequest(ApiLinks.prepareOrder, {
      "userId": userId.toString(),
      "orderId": orderId.toString(),
      "adminId": adminId.toString(),
      "deliveryType": deliveryType.toString(),
    });

    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }
}
