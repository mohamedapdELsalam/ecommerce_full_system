import 'package:adminapp/core/class/status_request.dart';
import 'package:adminapp/core/functions/handling_status_request.dart';
import 'package:adminapp/core/shared/custom_dialog.dart';
import 'package:adminapp/data/data_source/remote/coupons/add_coupon_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class AddCouponControllerAbs extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController codeCtrl = TextEditingController();
  TextEditingController discountCtrl = TextEditingController();
  TextEditingController expirationCtrl = TextEditingController();
  TextEditingController countCtrl = TextEditingController();
  StatusRequest statusRequest = StatusRequest.none;
  AddCouponsData addCouponsData = AddCouponsData();
  Future<void> addCoupon();
}

class AddCouponController extends AddCouponControllerAbs {
  @override
  Future<void> addCoupon() async {
    if (formKey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await addCouponsData.addCoupon(
        code: codeCtrl.text,
        count: countCtrl.text,
        discount: discountCtrl.text,
        expiredData: expirationCtrl.text,
      );
      statusRequest = handlingStatusRequest(response);
      if (statusRequest == StatusRequest.success) {
        if (response["status"] == "success") {
          Get.back(result: "refresh");
          showCustomDialog(
            title: "done",
            content: "coupon added successfully",
            onConfirm: () {},
          );
        } else {
          if (response["msg"] != null) {
            showCustomDialog(
              title: "error",
              content: "${response["msg"]}",
              onConfirm: () {},
            );
          } else {
            showCustomDialog(
              title: "error",
              content: "coupon not Added",
              onConfirm: () {},
            );
          }
          // statusRequest = StatusRequest.failure;
        }
      } else {
        statusRequest = StatusRequest.serverFailure;
      }
      update();
    }
  }
}
