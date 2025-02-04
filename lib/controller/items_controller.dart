import 'package:ecommerceapp/core/class/status_request.dart';
import 'package:ecommerceapp/core/constants/app_routes.dart';
import 'package:ecommerceapp/core/functions/handlindStatusRequest.dart';
import 'package:ecommerceapp/data/data_source/remote/items_data.dart';
import 'package:ecommerceapp/data/model/items_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class ItemsControllerAbstract extends GetxController {
  initialData();
  changeCategory(int index);
  getItems();
  openItemDetail(ItemsModel item);
  switchFavorite();

  ItemsModel itemsModel = ItemsModel();
  List categories = [];
  List items = [];
  bool isFavorite = false;
  RxInt selectedCateg = 0.obs;
  StatusRequest statusRequest = StatusRequest.none;
  ItemsData itemsData = ItemsData();
  late ScrollController scrollcontroller;
}

class ItemsController extends ItemsControllerAbstract {
  @override
  getItems() async {
    items.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await itemsData.itemsRequest(selectedCateg.value);
    statusRequest = handlindStatusRequest(response);
    update();

    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        items.addAll(response["data"]);
        update();
      } else {
        statusRequest = StatusRequest.failure;
        update();
      }
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    items.clear();
    initialData();
  }

  @override
  switchFavorite() {
    isFavorite = !isFavorite;
    update();
  }

  @override
  initialData() {
    categories = Get.arguments["categories"];
    selectedCateg.value = Get.arguments["selectedCateg"];

    getItems();
  }

  @override
  changeCategory(index) {
    selectedCateg.value = index;
    getItems();
  }

  @override
  openItemDetail(item) {
    Get.toNamed(AppRoutes.itemDetails, arguments: {
      "item": item,
    });
  }
}
