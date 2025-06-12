import 'package:ecommerceapp/core/class/status_request.dart';
import 'package:ecommerceapp/core/functions/handlindStatusRequest.dart';
import 'package:ecommerceapp/data/data_source/remote/cart_data.dart';
import 'package:ecommerceapp/data/data_source/remote/items_data.dart';
import 'package:ecommerceapp/data/model/item_variant.dart';
import 'package:ecommerceapp/data/model/items_model.dart';
import 'package:get/get.dart';

abstract class ItemsDetailsAbsract extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  late ItemsModel item;
  List<ItemVariantsModel> itemVariants = [];
  ItemsData itemsData = ItemsData();
  int? selectedColor;
  int? selectedSize;
  int? selectedStock;
  int count = 1;
  double totalPrice = 0;
  List availableSizes = [];
  CardData cartData = CardData();
  Future<void> addToCart();
  Future<void> getItemVariants();
  void selectColor(int colorId);
  void selectSize(int sizeId);
  void showAvailableSizesForColor(int colorId);
  void calcTotal();
  void addItem();
  void removeItem();
}

class ItemsDetailsController extends ItemsDetailsAbsract {
  @override
  void onInit() {
    item = Get.arguments["item"];
    getItemVariants();
    totalPrice = selectedStock == null
        ? count * item.finalPrice!
        : count * itemVariants[selectedStock!].stockPrice!.toDouble();
    super.onInit();
  }

  @override
  addToCart() async {
    // statusRequest = StatusRequest.loading;

    update();
    print("selected stock is : ----------------  $selectedStock");
    var response =
        await cartData.addCartRequest(item.itemsId!, selectedStock ?? 0);
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        // cartCount[i] = response["count"];
        // cartTotal += cartItems[i].finalPrice!;
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

    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        List data = response["data"];
        itemVariants.addAll(data.map((e) => ItemVariantsModel.fromJson(e)));
        print("variants: ");
        itemVariants.forEach((v) {
          print("color: ${v.colorsName}, size: ${v.sizesLabel}");
        });
      } else {
        statusRequest = StatusRequest.success;
        update();
      }
    }
    update();
  }

  @override
  void selectColor(int colorId) {
    selectedColor = colorId;
    selectedSize = null;

    showAvailableSizesForColor(colorId);

    update();
  }

  @override
  void selectSize(sizeId) {
    selectedSize = sizeId;
    int index = itemVariants
        .indexWhere((e) => e.sizesId == sizeId && e.colorsId == selectedColor);
    selectedStock = itemVariants[index].stockId;
    totalPrice = count * itemVariants[selectedStock!].stockPrice!.toDouble();
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
    print("moo ---------------- mo -----");
    print("🎯 Available sizes for color $colorId => $availableSizes");

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

  @override
  double calcTotal() {
    totalPrice = count * item.finalPrice!;
    update();
    return totalPrice;
  }

  @override
  void addItem() {
    count++;
    if (selectedStock != null) {
      totalPrice = count * itemVariants[selectedStock!].stockPrice!.toDouble();
    } else {
      totalPrice = count * item.finalPrice!;
    }
    update();
  }

  @override
  void removeItem() {
    if (count > 1) {
      count--;
      if (selectedStock != null) {
        totalPrice =
            count * itemVariants[selectedStock!].stockPrice!.toDouble();
      } else {
        totalPrice = count * item.finalPrice!;
      }
      update();
    }
  }
}
