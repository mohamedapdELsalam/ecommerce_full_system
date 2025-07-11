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
  List<ItemVariantModel> itemVariants = [];
  List<Map<String, dynamic>> paymobItems = [];
  int deliveryPrice = 20;
  int? selectedColor;
  int? selectedSize;
  ItemsData itemsData = ItemsData();

  Future<void> getCartItems();
  Future<void> addCart(int i);
  Future<void> removeCart(int itemId, int i);
  Future<void> deleteFromCart(int itemid);
  void deleteFromCartLocal(int itemid);
  Future<void> checkCoupon();
  void calculateCartTotal();
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
      return;
    }
    if (statusRequest == StatusRequest.success) {
      List data = response["data"];
      cartItems.addAll(data.map((e) => CartModel.fromJson(e)));
      update();
      totalCartItems = int.parse(response["countAndPrice"]["amount"]);
      for (int i = 0; i < cartItems.length; i++) {
        cartCount.add(cartItems[i].count!);
      }

      cartTotal = response["countAndPrice"]["cartTotalPrice"] + 0.0;
    } else {
      statusRequest = StatusRequest.failure;
    }
    statusRequest = StatusRequest.success;

    update();
  }

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
    } else {}
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
    return (cartTotal - (cartTotal * couponDiscount) / 100) + deliveryPrice;
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
    paymobItems = cartItems.map((e) {
      return {
        "name": e.itemsNameEn,
        "amount": e.finalPrice! * 100,
        "description": e.itemsDescEn,
        "quantity": e.count
      };
    }).toList();

    if (couponDiscount > 0) {
      paymobItems.add({
        "name": "coupon",
        "amount": -((cartTotal * couponDiscount) / 100 * 100),
        "description": "coupon discount",
        "quantity": 1
      });
    }
    Get.toNamed(AppRoutes.checkout, arguments: {
      "couponId": couponModel != null ? couponModel!.couponId.toString() : "0",
      "deliveryPrice": deliveryPrice.toString(),
      "totalPrice": (calculateCartTotal() - deliveryPrice).toString(),
      "paymobItem": paymobItems,
    });
  }
}
