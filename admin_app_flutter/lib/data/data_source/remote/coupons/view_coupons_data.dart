import 'package:adminapp/core/class/crud.dart';
import 'package:adminapp/core/constants/api_links.dart';

class ViewCouponsData {
  Crud crud = Crud();
  getCoupons() async {
    var response = await crud.getRequest(ApiLinks.viewCoupons);
    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }

  deleteCoupon(String couponId) async {
    var response = await crud.postRequest(ApiLinks.deleteCoupon, {
      "couponId": couponId,
    });
    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }
}
