import 'package:ecommerceapp/core/class/status_request.dart';
import 'package:ecommerceapp/core/functions/handlindStatusRequest.dart';
import 'package:ecommerceapp/data/data_source/remote/cart_data.dart';
import 'package:ecommerceapp/data/data_source/remote/items_data.dart';
import 'package:ecommerceapp/data/model/item_variant.dart';
import 'package:ecommerceapp/data/model/items_model.dart';
import 'package:get/get.dart';

abstract class ItemsDetailsAbsract extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  Future<void> addToCart();
  late ItemsModel item;
  List<ItemVariantsModel> itemVariants = [];
  ItemsData itemsData = ItemsData();
  int? selectedColor;
  int? selectedSize;
  List availableSizes = [];
  CardData cartData = CardData();
  Future<void> getItemVariants();
  void selectColor(int colorId);
  void selectSize(int sizeId);
  void showAvailableSizesForColor(int colorId);
}

class ItemsDetailsController extends ItemsDetailsAbsract {
  @override
  void onInit() {
    item = Get.arguments["item"];
    getItemVariants();
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

  @override
  Future<void> getItemVariants() async {
    itemVariants.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await itemsData.getItemsVariants(item.itemsId.toString());
    statusRequest = handlingStatusRequest(response);
    update();

    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        List data = response["data"];
        itemVariants.addAll(data.map((e) => ItemVariantsModel.fromJson(e)));
        update();
      } else {
        statusRequest = StatusRequest.failure;
        update();
      }
    }
    update();
  }

  @override
  void selectColor(int colorId) {
    selectedColor = colorId;
    showAvailableSizesForColor(colorId);
    update();
  }

  @override
  void selectSize(sizeId) {
    selectedSize = sizeId;
    update();
  }

  @override
  void showAvailableSizesForColor(int colorId) {
    availableSizes = itemVariants
        .where(
          (v) => v.colorsId == colorId,
        )
        .map(
          (v) => v.sizesId,
        )
        .toList();
    update();
  }

  List<ItemVariantsModel> get uniqueColors {
    final seenColors = <int>{}; // IDs of colors we've already added
    return itemVariants.where((variant) {
      if (seenColors.contains(variant.colorsId)) {
        return false;
      } else {
        seenColors.add(variant.colorsId!);
        return true;
      }
    }).toList();
  }
}
