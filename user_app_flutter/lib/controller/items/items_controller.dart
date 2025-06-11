import 'package:ecommerceapp/controller/homepage_controller.dart';
import 'package:ecommerceapp/core/class/status_request.dart';
import 'package:ecommerceapp/core/constants/app_routes.dart';
import 'package:ecommerceapp/core/functions/handlindStatusRequest.dart';
import 'package:ecommerceapp/data/data_source/remote/items_data.dart';
import 'package:ecommerceapp/data/model/items_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class ItemsControllerAbstract extends GetxController {
  void initialData();
  void changeCategory(int index);
  Future<void> getItems();
  Future<void> openItemDetail(ItemsModel item);

  ItemsModel itemsModel = ItemsModel();
  List categories = [];
  List<ItemsModel> items = [];
  bool isFavorite = false;
  RxInt selectedCateg = 0.obs;
  StatusRequest statusRequest = StatusRequest.none;
  ItemsData itemsData = ItemsData();
  late ScrollController scrollController;
}

class ItemsController extends ItemsControllerAbstract
    with HomePageSearchController {
  @override
  getItems() async {
    items.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await itemsData.getItemsRequest(selectedCateg.value);
    statusRequest = handlingStatusRequest(response);
    update();

    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        List data = response["data"];
        items.addAll(data.map((e) => ItemsModel.fromJson(e)));
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
  openItemDetail(item) async {
    Get.toNamed(AppRoutes.itemDetails, arguments: {
      "item": item,
    });
  }

  @override
  void resetStatus() {
    statusRequest = StatusRequest.none;
    update();
  }
}
