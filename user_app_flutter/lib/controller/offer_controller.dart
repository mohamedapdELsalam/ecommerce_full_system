import 'package:ecommerceapp/core/class/status_request.dart';
import 'package:ecommerceapp/core/constants/app_routes.dart';
import 'package:ecommerceapp/core/functions/handlindStatusRequest.dart';
import 'package:ecommerceapp/data/data_source/remote/offers_data.dart';
import 'package:ecommerceapp/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OffersControllerAbstract extends GetxController {
  OfferData offerData = OfferData();
  List<ItemsModel> offersItems = [];
  getOffers();
  openItemDetail(itemModel);
}

class OffersController extends OffersControllerAbstract
    with OffersSearchController {
  @override
  void onInit() async {
    super.onInit();
    await getOffers();
  }

  @override
  getOffers() async {
    print("---------------------------    get offers executed ");
    statusRequest = StatusRequest.loading;
    offersItems.clear();
    update();
    var response = await offerData.offersItemsRequest();
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        List data = response["data"];
        offersItems.addAll(data.map((e) => ItemsModel.fromJson(e)));
        // for (int i = 0; i < offersItems.length; i++) {
        //   setFavorite(offersItems[i].itemsId, offersItems[i].favorite);
        // }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  openItemDetail(itemModel) {
    Get.toNamed(AppRoutes.itemDetails, arguments: {
      "item": itemModel,
    });
  }
}

// ---------------- search

mixin OffersSearchController implements GetxController {
  List<ItemsModel> searchItemsList = [];
  bool isSearch = false;
  TextEditingController searchCtrl = TextEditingController();
  OfferData offerData = OfferData();
  StatusRequest statusRequest = StatusRequest.none;

  checkSearch(val) {
    if (val.isEmpty && isSearch) {
      isSearch = false;
      statusRequest = StatusRequest.none;
      update();
    }
  }

  getSearchItems(search) async {
    statusRequest = StatusRequest.none;
    try {
      var response = await offerData.searchRequest(search);

      statusRequest = handlingStatusRequest(response);
      searchItemsList.clear();
      update();

      if (statusRequest == StatusRequest.success) {
        if (response["status"] == "success") {
          List data = response["data"];
          searchItemsList.addAll(data.map((e) => ItemsModel.fromJson(e)));
        } else {
          statusRequest = StatusRequest.failure;
          update();
        }
      } else {
        print(
            "fffffffffffffffffffffffffffffffffffffffffff-------------------------------");
      }
    } catch (e) {
      print("-------- error  :: $e");
    }
    update();
  }

  onSearch() async {
    if (searchCtrl.text.isNotEmpty) {
      isSearch = true;
      searchItemsList.clear();
      update();
      await getSearchItems(searchCtrl.text);
    }
  }

  void resetStatus() {
    statusRequest = StatusRequest.none;
    update();
  }
}
