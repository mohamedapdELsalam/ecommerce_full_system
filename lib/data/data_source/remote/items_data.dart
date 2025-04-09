import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/core/constants/apiLink.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:get/get.dart';

class ItemsData {
  Crud crud = Get.find();
  MyServices myServices = Get.find();

  ItemsData();

  itemsRequest(int categoryId) async {
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

 
}
