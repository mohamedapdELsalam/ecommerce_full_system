import 'package:adminapp/core/class/status_request.dart';
import 'package:adminapp/core/constants/app_routes.dart';
import 'package:adminapp/core/functions/handling_status_request.dart';
import 'package:adminapp/core/shared/custom_dialog.dart';
import 'package:adminapp/data/data_source/remote/coupons/view_coupons_data.dart';
import 'package:adminapp/data/model/coupon_model.dart';
import 'package:get/get.dart';

abstract class ViewCouponsControllerAbstract extends GetxController {
  StatusRequest statusRequest = StatusRequest.loading;
  ViewCouponsData viewCouponsData = ViewCouponsData();
  List<CouponModel> coupons = [];

  Future<void> getCoupons();
  Future<void> deleteCoupon(int couponId);
  void editCoupon(int i);
}

class ViewCouponsController extends ViewCouponsControllerAbstract {
  @override
  void onInit() {
    super.onInit();
    getCoupons();
  }

  @override
  Future<void> getCoupons() async {
    coupons.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await viewCouponsData.getCoupons();
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        List data = response["data"];
        coupons.addAll(data.map((e) => CouponModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.serverFailure;
    }
    update();
  }

  @override
  Future<void> deleteCoupon(int couponId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await viewCouponsData.deleteCoupon(couponId.toString());
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        showCustomDialog(
          title: "done",
          onConfirm: () {},
          content: "coupon deleted successfully",
        );
        getCoupons();
      } else {
        showCustomDialog(
          title: "error",
          onConfirm: () {},
          content: "coupon not deleted ",
        );
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.serverFailure;
    }
    update();
  }

  @override
  void editCoupon(i) async {
    int index = coupons.indexWhere((e) => e.couponId == i);
    String result = await Get.toNamed(
      AppRoutes.editCoupon,
      arguments: {"coupon": coupons[index]},
    );
    if (result == "refresh") {
      getCoupons();
    }
  }
}
