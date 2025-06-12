import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/core/constants/api_links.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:get/get.dart';

class CardData {
  Crud crud = Get.find();
  MyServices myServices = Get.find();

  getCartRequest() async {
    try {
      var response = await crud.postRequest(ApiLinks.viewCart, {
        "userId": myServices.sharedPref.getInt(("user_id")).toString(),
      });

      print("response in getcart request : ${response}");

      if (response.isRight()) {
        return response.fold((l) => null, (r) => r);
      } else {
        return response.fold((l) => l, (r) => null);
      }
    } catch (e) {
      print("erorr in getcart request : ${e}");
    }
  }

  addCartRequest(int itemId, int variantId) async {
    var response = await crud.postRequest(ApiLinks.addCart, {
      "userId": myServices.sharedPref.getInt("user_id").toString(),
      "itemId": itemId.toString(),
      "variantId": variantId.toString(),
    });
    print("-----------------------   mohamed  ---------");
    print("----------------------- $variantId ---------");
    print(response);

    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }

  subtractCartRequest(int itemId) async {
    var response = await crud.postRequest(ApiLinks.subtractCart, {
      "userId": myServices.sharedPref.getInt("user_id").toString(),
      "itemId": itemId.toString(),
    });

    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }

  removeItemCartRequest(int itemId) async {
    var response = await crud.postRequest(ApiLinks.removeItemFromCart, {
      "userId": myServices.sharedPref.getInt("user_id").toString(),
      "itemId": itemId.toString(),
    });

    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }

  checkCouponRequest(String coupon) async {
    var response = await crud.postRequest(ApiLinks.checkCoupon, {
      "coupon": coupon,
    });

    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }
}
