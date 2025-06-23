import 'package:ecommerceapp/core/class/status_request.dart';
import 'package:ecommerceapp/core/constants/app_routes.dart';
import 'package:ecommerceapp/core/constants/lang_keys.dart';
import 'package:ecommerceapp/core/functions/handlindStatusRequest.dart';
import 'package:ecommerceapp/core/paymob_flash_manager/pay_with_paymob.dart';
import 'package:ecommerceapp/data/data_source/remote/address_data.dart';
import 'package:ecommerceapp/data/data_source/remote/checkout_data.dart';
import 'package:ecommerceapp/data/model/address_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class PlaceOrderControllerAbstract extends GetxController {
  late String couponId;
  late int deliveryPrice;
  double? totalPrice = 0;
  StatusRequest statusRequest = StatusRequest.none;
  int? deliveryMethod;
  int? addressId;
  String? shippingAddress;
  int? paymentMethod;
  CheckoutData orderData = CheckoutData();
  AddressData addressData = AddressData();
  List<Map<String, dynamic>> paymobItems = [];
  List<Map<String, dynamic>> paymobItemsDelivery = [];

  int currentStep = 0;
  Future checkout();
  double calculateOrderTotal();

  void nextStep();
  void changeStep(int val);
  Future<void> getAddresses();
  SnackbarController? pay(BuildContext context);
  void changePaymentMethod(int val);
  void changeShippingAddress(String val);
  void changeDeliveryMethod(int val);

  List<AddressModel> addressesList = [];
}

class PlaceOrderController extends PlaceOrderControllerAbstract {
  @override
  void onInit() async {
    super.onInit();
    couponId = Get.arguments["couponId"];
    deliveryPrice = int.parse(Get.arguments["deliveryPrice"]);
    totalPrice = double.parse(Get.arguments["totalPrice"]);
    // totalPrice = 800.0;
    print("************* total price in place order ****************");
    print(totalPrice);
    paymobItems = Get.arguments["paymobItem"];
    paymobItemsDelivery = paymobItems;
    await getAddresses();
  }

  @override
  pay(context) {
    if (deliveryMethod == null) {
      return Get.snackbar(LangKeys.error.tr, LangKeys.chooseDelivery.tr);
    }
    if (shippingAddress == null && deliveryMethod == 0) {
      return Get.snackbar(LangKeys.error.tr, LangKeys.chooseAddress.tr);
    }
    if (paymentMethod == null) {
      return Get.snackbar(LangKeys.error.tr, LangKeys.choosePayment.tr);
    }
    if (deliveryMethod == 0) {
      paymobItemsDelivery.add({
        "name": "delivery price",
        "amount": deliveryPrice * 100,
        "description": "delivery price",
        "quantity": 1
      });
    }
    payWithPaymobFlash(
        context: context,
        amount: calculateOrderTotal(),
        items: paymobItemsDelivery);
    paymobItemsDelivery.clear();
    paymobItemsDelivery = paymobItems;
    return null;
  }

  @override
  checkout() async {
    if (deliveryMethod == null) {
      return Get.snackbar(LangKeys.error.tr, LangKeys.chooseDelivery.tr);
    }
    if (shippingAddress == null && deliveryMethod == 0) {
      return Get.snackbar(LangKeys.error.tr, LangKeys.chooseAddress.tr);
    }
    if (paymentMethod == null) {
      return Get.snackbar(LangKeys.error.tr, LangKeys.choosePayment.tr);
    }
    statusRequest = StatusRequest.loading;
    update();

    try {
      var response = await orderData.checkoutRequest(
          couponId: couponId,
          deliveryPrice: deliveryPrice.toString(),
          deliveryType: deliveryMethod.toString(),
          paymentMethod: paymentMethod.toString(),
          totalPrice: calculateOrderTotal.toString(),
          addressId: deliveryMethod == 1 ? "0" : addressId.toString());

      statusRequest = handlingStatusRequest(response);
      if (statusRequest == StatusRequest.success) {
        if (response["status"] == "success") {
          Get.offAllNamed(AppRoutes.homeScreen);
          Get.snackbar(LangKeys.done.tr, LangKeys.orderSuccess.tr);
        } else {
          statusRequest = StatusRequest.failure;
          Get.snackbar("Error", "the order not created ");
        }
      } else {
        Get.snackbar("Error", "the order not created!!!!!!!!!!!1 ");
      }
    } catch (e) {
      print("------------------ exception error is : $e");
    }
    ;

    update();
  }

  @override
  nextStep() {
    if (currentStep < 2) {
      currentStep++;
    }
    update();
  }

  @override
  changeStep(val) {
    currentStep = val;
    update();
  }

  @override
  void changeDeliveryMethod(int val) {
    deliveryMethod = val;
    nextStep();
    if (val == 1) {
      nextStep();
    }
  }

  @override
  void changePaymentMethod(int val) {
    paymentMethod = val;
    nextStep();
  }

  @override
  void changeShippingAddress(String val) {
    shippingAddress = val;
    nextStep();
  }

  @override
  getAddresses() async {
    statusRequest = StatusRequest.loading;
    var response = await addressData.getAddressesRequest();
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        List data = response["data"];
        addressesList.addAll(data.map((e) => AddressModel.fromJson(e)));
        addressId = addressesList[0].addressId;
        shippingAddress = addressesList[0].name;
      } else {}
    }
  }

  @override
  double calculateOrderTotal() {
    if (deliveryMethod == 0) {
      return totalPrice! + deliveryPrice;
    } else {
      return totalPrice!;
    }
  }
}
