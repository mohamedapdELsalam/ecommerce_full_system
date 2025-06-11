import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/core/constants/api_links.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/instance_manager.dart';

class CheckoutData {
  Crud crud = Crud();
  MyServices myServices = Get.find();

  checkoutRequest({
    required String totalPrice,
    required String deliveryPrice,
    required String couponId,
    required String paymentMethod,
    required String deliveryType,
    required String addressId,
  }) async {
    var response = await crud.postRequest(ApiLinks.checkout, {
      "userId": myServices.sharedPref.getInt("user_id").toString(),
      "totalPrice": totalPrice,
      "deliveryPrice": deliveryPrice,
      "couponId": couponId,
      "paymentMethod": paymentMethod,
      "deliveryType": deliveryType,
      "addressId": addressId,
    });

    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }
}
