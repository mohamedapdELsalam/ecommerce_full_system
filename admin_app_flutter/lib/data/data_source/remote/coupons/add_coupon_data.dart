import 'package:adminapp/core/class/crud.dart';
import 'package:adminapp/core/constants/api_links.dart';

class AddCouponsData {
  Crud crud = Crud();
  addCoupon({
    required String? code,
    required String? discount,
    required String? count,
    required String? expiredData,
  }) async {
    var response = await crud.postRequest(ApiLinks.addCoupons, {
      "code": code,
      "discount": discount,
      "count": count,
      "expiredDate": expiredData,
    });
    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }
}
