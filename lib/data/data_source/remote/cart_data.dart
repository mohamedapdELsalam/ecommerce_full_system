import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/core/constants/apiLink.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:get/get.dart';

class CardData {
  Crud crud = Get.find();
  MyServices myServices = Get.find();

  CardData();

  addingCartRequest(int itemId) async {
    var response = await crud.postRequest(ApiLinks.addCart, {
      "userId": myServices.sharedPref.getInt("user_id").toString(),
      "itemId": itemId.toString(),
    });

    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }
}
