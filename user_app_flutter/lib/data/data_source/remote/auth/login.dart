import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/core/constants/api_links.dart';
import 'package:get/get.dart';

class LoginData {
  Crud crud = Get.find();

  LoginData();

  loginRequest({String? email, String? password}) async {
    var response = await crud.postRequest(ApiLinks.loginLinkApi, {
      "email": email,
      "password": password,
    });

    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }
}
