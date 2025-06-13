import 'package:ecommerceapp/core/class/status_request.dart';
import 'package:ecommerceapp/core/constants/app_routes.dart';
import 'package:ecommerceapp/core/constants/lang_keys.dart';
import 'package:ecommerceapp/core/functions/handlindStatusRequest.dart';
import 'package:ecommerceapp/core/shared/custom_dialog.dart';
import 'package:ecommerceapp/data/data_source/remote/cart_data.dart';
import 'package:ecommerceapp/data/data_source/remote/items_data.dart';
import 'package:ecommerceapp/data/model/cart_model.dart';
import 'package:ecommerceapp/data/model/coupon_model.dart';
import 'package:ecommerceapp/data/model/item_variant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class CartControllerAbstract extends GetxController {
  TextEditingController couponCtrl = TextEditingController();
  CardData cartData = CardData();
  CouponModel? couponModel;
  int couponDiscount = 0;
  StatusRequest statusRequest = StatusRequest.none;
  List<CartModel> cartItems = [];
  int totalCartItems = 0;
  RxList cartCount = [].obs;
  double cartTotal = 0;
  List<ItemVariantsModel> itemVariants = [];

  int? selectedColor;
  int? selectedSize;
  ItemsData itemsData = ItemsData();

  Future<void> getCartItems();
  addCart(int i);
  removeCart(int itemId, int i);
  deleteFromCart(int itemid);
  deleteFromCartLocal(int itemid);
  checkCoupon();
  calculateCartTotal();
  void goToCheckout();
}

class CartController extends CartControllerAbstract {
  @override
  getCartItems() async {
    cartItems.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.getCartRequest();
    statusRequest = handlingStatusRequest(response);
    if (response["data"] == null || response["data"] == 0) {
      cartTotal = 0.0;
      totalCartItems = 0;
      statusRequest = StatusRequest.failure;
      update();
      print("------------- data is null");
      return;
    }
    if (statusRequest == StatusRequest.success) {
      print("---------response data : ${response["data"]}");
      List data = response["data"];
      cartItems.addAll(data.map((e) => CartModel.fromJson(e)));
      update();
      print("---------------------------------- ismael yasseen -------");
      totalCartItems = int.parse(response["countAndPrice"]["amount"]);
      for (int i = 0; i < cartItems.length; i++) {
        cartCount.add(cartItems[i].count!);
      }

      cartTotal = response["countAndPrice"]["cartTotalPrice"] + 0.0;
      print("----------------------- cartTotal : $cartTotal");
      print(
          "----------------------- type cartTotal : ${cartTotal.runtimeType}");
    } else {
      statusRequest = StatusRequest.failure;
      print(" ====== error in get cart items");
    }
    print("----------------- statusRequest : $statusRequest");
    statusRequest = StatusRequest.success;

    update();
  }

  // @override
  // Future<void> getItemVariants() async {
  //   itemVariants.clear();
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   var response = await itemsData.getItemsVariants(item.itemsId.toString());
  //   statusRequest = handlingStatusRequest(response);

  //   if (statusRequest == StatusRequest.success) {
  //     if (response["status"] == "success") {
  //       List data = response["data"];
  //       itemVariants.addAll(data.map((e) => ItemVariantsModel.fromJson(e)));
  //       print("variants: ");
  //       itemVariants.forEach((v) {
  //         print("color: ${v.colorsName}, size: ${v.sizesLabel}");
  //       });
  //     } else {
  //       statusRequest = StatusRequest.success;
  //       update();
  //     }
  //   }
  //   update();
  // }

  @override
  addCart(
    i,
  ) async {
    // statusRequest = StatusRequest.loading;
    int itemId = cartItems[i].itemsId!;
    cartCount[i]++;
    totalCartItems++;
    cartTotal += cartItems[i].finalPrice!;
    update();
    var response = await cartData.addCartRequest(
        itemId, cartItems[i].cartSelectedVariant!);
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        // cartCount[i] = response["count"];
        // cartTotal += cartItems[i].finalPrice!;
        // Get.showSnackbar(GetSnackBar(
        //   duration: Duration(seconds: 1),
        //   title: "added to cart successfully",
        //   message: "done",
        // ));
      } else {
        statusRequest = StatusRequest.failure;
        Get.showSnackbar(GetSnackBar(
          title: "error",
        ));
      }
    }
    update();
    return response["count"];
  }

  @override
  removeCart(itemId, i) async {
    // statusRequest = StatusRequest.loading;
    if (cartCount[i] > 1) {
      // i =2
      totalCartItems--;
      cartCount[i] -= 1; // i =1
      cartTotal -= cartItems[i].finalPrice!;
      update();
      var response = await cartData.subtractCartRequest(itemId);
      statusRequest = handlingStatusRequest(response);
      if (statusRequest == StatusRequest.success) {
        update();
        if (response["status"] == "success") {
          // cartCount[i] = response["count"];
          // cartTotal -= cartItems[i].finalPrice!;

          update();
          // Get.showSnackbar(GetSnackBar(
          //   title: "removed from cart successfully",
          //   message: "done ",
          // ));
        } else {
          // Get.showSnackbar(GetSnackBar(
          //   title: "error",
          //   message: "error ",
          // ));
        }
        update();
      }
      return response["count"];
    }
  }
  // @override
  // showItem() {
  //   Get.toNamed(AppRoutes.itemDetails, arguments: {"item"});
  // }

  @override
  void onInit() async {
    await getCartItems();
    super.onInit();
  }

  @override
  deleteFromCart(int itemid) async {
    deleteFromCartLocal(itemid);
    var response = await cartData.removeItemCartRequest(itemid);
    if (response["status"] == "success") {
      print("item removed from cart finally");
    } else {
      print("error ----- item not removed");
    }
    cartItems.clear();
    getCartItems();
  }

  @override
  deleteFromCartLocal(int itemid) {
    cartItems.removeWhere((e) => e.itemsId == itemid);
    update();
  }

  @override
  checkCoupon() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.checkCouponRequest(couponCtrl.text);
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        Map<String, dynamic> data = response['data'];
        couponModel = CouponModel.fromJson(data);
        couponDiscount = couponModel!.couponDiscount!;
        update();
      } else {
        Get.snackbar("error", "make sure your coupon");
      }
    } else {}
    update();
  }

  @override
  double calculateCartTotal() {
    return cartTotal - (cartTotal * couponDiscount) / 100;
  }

  @override
  void goToCheckout() {
    if (cartItems.isEmpty) {
      showCustomDialog(
        content: LangKeys.cartIsEmpty.tr,
        onConfirm: () {},
      );
      return;
    }
    Get.toNamed(AppRoutes.checkout, arguments: {
      "couponId": couponModel != null ? couponModel!.couponId.toString() : "0",
      "deliveryPrice": "20",
      "totalPrice": calculateCartTotal().toString(),
    });
  }
}
