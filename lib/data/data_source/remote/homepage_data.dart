import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/core/constants/apiLink.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:get/get.dart';

class HomePageData {
  Crud crud = Get.find();

  HomePageData();

  homepageRequest() async {
    // MyServices myServices = Get.put(MyServices());
    var response = await crud.postRequest(ApiLinks.homePageLinkApi, {
      // "id": myServices.sharedPref.getInt("user_id").toString(),
    });

    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }
}
