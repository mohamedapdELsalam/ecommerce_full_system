import 'package:ecommerceapp/core/class/status_request.dart';
import 'package:ecommerceapp/core/functions/handlindStatusRequest.dart';
import 'package:ecommerceapp/data/data_source/remote/cart_data.dart';
import 'package:ecommerceapp/data/model/cart_model.dart';
import 'package:get/get.dart';

abstract class CartControllerAbstract extends GetxController {
  // showItem();
  CardData cartData = CardData();
  getCartItems() {}
  addCart(int itemId, int i);
  removeCart(int itemId, int i);
  deleteFromCart(int itemid);
  deleteFromCartLocal(int itemid);
  StatusRequest statusRequest = StatusRequest.none;
  List<CartModel> cartItems = [];
  RxList cartCount = [].obs;
  double cartTotal = 0;
  int totalCartItems = 0;
}

class CartController extends CartControllerAbstract {
  @override
  getCartItems() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.getCartRequest();
    statusRequest = handlingStatusRequest(response);
    if (response["data"] == null) {
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

      for (int i = 0; i < cartItems.length; i++) {
        cartCount.add(cartItems[i].amount!);
      }

      totalCartItems = int.parse(response["countAndPrice"]["amount"]);
      print(
          "############################################################################################3333");
      cartTotal = response["countAndPrice"]["cartTotalPrice"] + 0.0;
      print("----------------------- cartTotal : $cartTotal");
      print(
          "----------------------- type cartTotal : ${cartTotal.runtimeType}");

      update();
    } else {
      statusRequest = StatusRequest.failure;
      print(" ====== error in get cart items");
    }
    update();
  }

  @override
  addCart(itemId, i) async {
    // countItems++;
    // statusRequest = StatusRequest.loading;
    totalCartItems++;
    update();
    var response = await cartData.addCartRequest(itemId);
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      update();
      if (response["status"] == "success") {
        cartCount[i] = response["count"];
        cartTotal += cartItems[i].itemsPrice!;
        update();
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
      update();
    }
    return response["count"];
  }

  @override
  removeCart(itemId, i) async {
    // statusRequest = StatusRequest.loading;
    if (cartCount[i] > 0) totalCartItems--;
    update();
    var response = await cartData.subtractCartRequest(itemId);
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      update();
      if (response["status"] == "success") {
        cartCount[i] = response["count"];
        cartTotal -= cartItems[i].itemsPrice!;

        update();
        // Get.showSnackbar(GetSnackBar(
        //   title: "removed from cart successfully",
        //   message: "done ",
        // ));
      } else {
        statusRequest = StatusRequest.failure;
        // Get.showSnackbar(GetSnackBar(
        //   title: "error",
        //   message: "error ",
        // ));
      }
      update();
    }
    return response["count"];
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
}
