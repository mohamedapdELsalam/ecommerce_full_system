import 'package:adminapp/core/class/status_request.dart';
import 'package:adminapp/core/functions/handling_status_request.dart';
import 'package:adminapp/core/shared/alert_dialog.dart';
import 'package:adminapp/core/shared/custom_dialog.dart';
import 'package:adminapp/data/data_source/remote/coupons/view_coupons_data.dart';
import 'package:adminapp/data/model/coupon_model.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

abstract class ViewCouponsControllerAbstract extends GetxController {
  StatusRequest statusRequest = StatusRequest.loading;
  ViewCouponsData viewCouponsData = ViewCouponsData();
  List<CouponModel> coupons = [];

  Future<void> getCoupons();
  Future<void> deleteCoupon(int couponId);
  Future<void> editCoupon();
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
    var response = await viewCouponsData.removeCoupon(couponId.toString());
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
  Future<void> editCoupon() {
    // TODO: implement editCoupon
    throw UnimplementedError();
  }
}
