import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/core/constants/apiLink.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:get/get.dart';

class OfferData {
  Crud crud = Get.find();
  MyServices myServices = Get.find();

  offersItemsRequest() async {
    var response = await crud.postRequest(ApiLinks.getOffers,
        {"userId": myServices.sharedPref.getInt("user_id").toString()});

    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }

  searchRequest(String search) async {
    var response =
        await crud.postRequest(ApiLinks.searchOffers, {"search": search});
    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }
}
