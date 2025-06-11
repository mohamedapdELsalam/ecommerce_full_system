import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/core/constants/api_links.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:get/get.dart';

class TestData {
  Crud crud;

  TestData(this.crud);

  getData() async {
    MyServices myServices = Get.put(MyServices());
    var response = await crud.postRequest(ApiLinks.getDataLinkApi, {
      "id": myServices.sharedPref.getInt("user_id").toString(),
    });

    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }
}
