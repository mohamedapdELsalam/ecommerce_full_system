import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/core/class/status_request.dart';
import 'package:ecommerceapp/core/constants/api_links.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:get/get.dart';

class ItemsData {
  Crud crud = Get.find();
  MyServices myServices = Get.find();

  ItemsData();

  getItemsRequest(int categoryId) async {
    var response = await crud.postRequest(ApiLinks.items, {
      "categoryId": categoryId.toString(),
      "userId": myServices.sharedPref.getInt("user_id").toString(),
    });

    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }

  dynamic getItemsVariants(String itemId) async {
    var response =
        await crud.postRequest(ApiLinks.itemsVariants, {"itemId": itemId});

    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }
}
