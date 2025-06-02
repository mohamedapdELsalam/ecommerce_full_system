import 'package:adminapp/core/class/crud.dart';
import 'package:adminapp/core/constants/api_links.dart';

class EditCouponsData {
  Crud crud = Crud();
  editCoupon({
    required String? code,
    required String? discount,
    required String? count,
    required String? expiredData,
    required String? couponId,
  }) async {
    var response = await crud.postRequest(ApiLinks.editCoupons, {
      "code": code,
      "discount": discount,
      "count": count,
      "expiredDate": expiredData,
      "couponId": couponId,
    });
    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }
}
