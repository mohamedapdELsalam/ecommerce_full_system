import 'package:ecommerceapp/core/class/status_request.dart';
import 'package:ecommerceapp/core/constants/app_routes.dart';
import 'package:ecommerceapp/core/functions/handlindStatusRequest.dart';
import 'package:ecommerceapp/data/data_source/remote/address_data.dart';
import 'package:ecommerceapp/data/data_source/remote/checkout_data.dart';
import 'package:ecommerceapp/data/model/address_model.dart';
import 'package:get/get.dart';

abstract class CheckoutControllerAbstract extends GetxController {
  late String couponId;
  late String deliveryPrice;
  late String totalPrice;
  StatusRequest statusRequest = StatusRequest.none;

  int? deliveryMethod;
  int? addressId;
  String? shippingAddress;
  int? paymentMethod;
  CheckoutData orderData = CheckoutData();
  AddressData addressData = AddressData();

  int currentStep = 0;
  checkout();

  void nextStep();
  void changeStep(int val);
  Future<void> getAddresses();
  void changePaymentMethod(int val);
  void changeShippingAddress(String val);
  void changeDeliveryMethod(int val);
  // AddressesViewController addressController =
  //     Get.put(AddressesViewController());
  List<AddressModel> addressesList = [];
}

class CheckoutController extends CheckoutControllerAbstract {
  @override
  void onInit() async {
    super.onInit();
    couponId = Get.arguments["couponId"];
    deliveryPrice = Get.arguments["deliveryPrice"];
    totalPrice = Get.arguments["totalPrice"];
    await getAddresses();
    // AddressesList = addressController.addressesList;
  }

  @override
  checkout() async {
    if (deliveryMethod == null) {
      return Get.snackbar("error", "please choose a delivery method");
    }
    if (shippingAddress == null && deliveryMethod == 0) {
      return Get.snackbar("error", "please choose a  address");
    }
    if (paymentMethod == null) {
      return Get.snackbar("error", "please choose a payment method");
    }

    statusRequest = StatusRequest.loading;
    update();

    try {
      var response = await orderData.checkoutRequest(
          couponId: couponId,
          deliveryPrice: deliveryPrice,
          deliveryType: deliveryMethod.toString(),
          paymentMethod: paymentMethod.toString(),
          totalPrice: totalPrice,
          addressId: deliveryMethod == 1 ? "0" : addressId.toString());

      statusRequest = handlingStatusRequest(response);
      if (statusRequest == StatusRequest.success) {
        if (response["status"] == "success") {
          Get.offAllNamed(AppRoutes.homeScreen);
          Get.snackbar("done", "the order created successfully ");
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
}
