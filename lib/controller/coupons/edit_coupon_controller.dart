import 'package:adminapp/core/class/status_request.dart';
import 'package:adminapp/core/functions/handling_status_request.dart';
import 'package:adminapp/core/shared/custom_dialog.dart';
import 'package:adminapp/data/data_source/remote/coupons/edit_coupon_data.dart';
import 'package:adminapp/data/model/coupon_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class EditCouponControllerAbs extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController codeCtrl = TextEditingController();
  TextEditingController discountCtrl = TextEditingController();
  TextEditingController expirationCtrl = TextEditingController();
  TextEditingController countCtrl = TextEditingController();
  StatusRequest statusRequest = StatusRequest.none;
  EditCouponsData editCouponsData = EditCouponsData();
  CouponModel couponModel = CouponModel();
  Future<void> editCoupon();
}

class EditCouponController extends EditCouponControllerAbs {
  @override
  void onInit() {
    super.onInit();
    couponModel = Get.arguments["coupon"];
    codeCtrl.text = couponModel.couponCode!;
    discountCtrl.text = couponModel.couponDiscount.toString();
    expirationCtrl.text = couponModel.couponExpiredDate!.replaceRange(
      10,
      19,
      "",
    );
    countCtrl.text = couponModel.couponCount.toString();
  }

  @override
  Future<void> editCoupon() async {
    if (formKey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await editCouponsData.editCoupon(
        code: codeCtrl.text,
        count: countCtrl.text,
        discount: discountCtrl.text,
        expiredData: expirationCtrl.text,
        couponId: couponModel.couponId.toString(),
      );
      statusRequest = handlingStatusRequest(response);
      if (statusRequest == StatusRequest.success) {
        if (response["status"] == "success") {
          Get.back(result: "refresh");
          showCustomDialog(
            title: "done",
            content: "coupon saved successfully",
            onConfirm: () {},
          );
        } else {
          showCustomDialog(
            title: "error",
            content: "coupon not saved",
            onConfirm: () {},
          );
          // statusRequest = StatusRequest.failure;
        }
      } else {
        statusRequest = StatusRequest.serverFailure;
      }
      update();
    }
  }
}
