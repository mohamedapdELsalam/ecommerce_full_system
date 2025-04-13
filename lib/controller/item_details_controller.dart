import 'package:ecommerceapp/core/class/status_request.dart';
import 'package:ecommerceapp/core/functions/handlindStatusRequest.dart';
import 'package:ecommerceapp/data/data_source/remote/cart_data.dart';
import 'package:ecommerceapp/data/model/items_model.dart';
import 'package:get/get.dart';

abstract class ItemsDetailsAbsract extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  addToCart();
  late ItemsModel item;
  CardData cartData = CardData();
}

class ItemsDetailsController extends ItemsDetailsAbsract {
  @override
  void onInit() {
    item = Get.arguments["item"];
    super.onInit();
  }

  @override
  addToCart() async {
    // statusRequest = StatusRequest.loading;

    update();
    var response = await cartData.addCartRequest(item.itemsId!);
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
}
