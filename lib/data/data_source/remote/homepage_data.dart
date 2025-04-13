import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/core/constants/apiLink.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:get/get.dart';

class HomePageData {
  Crud crud = Crud();
  MyServices myServices = Get.find();

  HomePageData();

  homepageRequest() async {
    var response = await crud.postRequest(ApiLinks.homePageLinkApi, {
      "userId": myServices.sharedPref.getInt("user_id").toString(),
    });

    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }

  searchRequest(String search) async {
    var response =
        await crud.postRequest(ApiLinks.searchAllItems, {"search": search});
    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }
}
