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
  StatusRequest statusRequest = StatusRequest.none;
  List<cartModel> cartItems = [];
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
    if (statusRequest == StatusRequest.success) {
      print("---------response data : ${response["data"]}");
      List data = response["data"];
      cartItems.addAll(data.map((e) => cartModel.fromJson(e)));
      update();

      for (int i = 0; i < cartItems.length; i++) {
        cartCount.add(cartItems[i].amount!);
      }

      totalCartItems = int.parse(response["countAndPrice"]["amount"]);
      cartTotal = response["countAndPrice"]["cartTotalPrice"] as double;

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
        Get.showSnackbar(GetSnackBar(
          duration: Duration(seconds: 1),
          title: "added to cart successfully",
          message: "done",
        ));
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
    var response = await cartData.removeCartRequest(itemId);
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      update();
      if (response["status"] == "success") {
        cartCount[i] = response["count"];
        cartTotal -= cartItems[i].itemsPrice!;

        update();
        Get.showSnackbar(GetSnackBar(
          title: "removed from cart successfully",
          message: "done ",
        ));
      } else {
        statusRequest = StatusRequest.failure;
        Get.showSnackbar(GetSnackBar(
          title: "error",
          message: "error ",
        ));
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
}
