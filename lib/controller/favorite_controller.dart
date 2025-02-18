import 'package:ecommerceapp/core/class/status_request.dart';
import 'package:ecommerceapp/core/functions/handlindStatusRequest.dart';
import 'package:ecommerceapp/data/data_source/remote/favorite_data.dart';
import 'package:ecommerceapp/data/model/items_model.dart';
import 'package:get/get.dart';

abstract class FavoriteControllerAbstract extends GetxController {
  Map isFavorite = {};
  FavoriteData favoriteData = FavoriteData();
  StatusRequest statusRequest = StatusRequest.none;
  List<ItemsModel> favoriteProducts = [];
  addToFavorite(int itemId, String itemName);
  deleteFromFavorite(int itemId, String itemName);
  getFavorites();
}

class FavoriteController extends FavoriteControllerAbstract {
  @override
  getFavorites() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await FavoriteData().viewFavorite();
    statusRequest = handlindStatusRequest(response);
    update();
    if (response["status"] == "success") {
      List data = (response["data"]);
      favoriteProducts.addAll(data.map((e) => ItemsModel.fromJson(e)));

      update();
    } else {
      statusRequest = StatusRequest.failure;
      update();
    }
  }

  @override
  addToFavorite(itemId, itemName) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await favoriteData.addFavorite(itemId);
    statusRequest = handlindStatusRequest(response);
    if (response['status'] == "success") {
      Get.rawSnackbar(
          message: "$itemName" " added to favorite successfully".tr);
    } else {
      Get.rawSnackbar(
          title: "fail", message: "$itemName " "something error !!".tr);
    }
  }

  @override
  deleteFromFavorite(itemId, itemName) async {
    var response = await favoriteData.deleteFavorite(itemId);
    if (response['status'] == "success") {
      Get.rawSnackbar(
          message: "$itemName" " removed from favorite successfully".tr);
    } else {
      Get.rawSnackbar(
          title: "fail", message: "$itemName" " something error !!".tr);
    }
    update();
  }

  deleteFromLocal(ItemsModel itemModel) {
    favoriteProducts.removeWhere(
      (element) => element.itemsId == itemModel.itemsId,
    );

    update();
  }

  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  @override
  void onInit() async {
    super.onInit();
    await getFavorites();
  }
}
