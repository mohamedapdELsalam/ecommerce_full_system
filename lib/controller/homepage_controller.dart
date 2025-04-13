import 'package:ecommerceapp/controller/auth/login_controller.dart';
import 'package:ecommerceapp/controller/favorite_controller.dart';
import 'package:ecommerceapp/core/class/status_request.dart';
import 'package:ecommerceapp/core/constants/app_routes.dart';
import 'package:ecommerceapp/core/functions/handlindStatusRequest.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/data_source/remote/homepage_data.dart';
import 'package:ecommerceapp/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomePageControllerAbstract extends GetxController {
  LoginController loginController = Get.put(LoginController());
  FavoriteController favoriteController = Get.put(FavoriteController());
  MyServices myServices = Get.find();
  initializeUserData();
  switchFavorite();
  getData();
  gotoItems(int selectedCateg);
  openItemDetail(ItemsModel itemModel);

  HomePageData homepageData = HomePageData();
  StatusRequest statusRequest = StatusRequest.none;
  List categories = [];
  List items = [];
  List itemsDiscount = [];
  List<ItemsModel> topSelling = [];

  int? userId;
  String? userName;
  String? email;
  String? phone;
  String? password;
  RxInt currentIndex = 0.obs;
  late ScrollController scrollController;
  bool isFavorite = false;
  double cardWidth = MediaQuery.sizeOf(Get.context!).width >= 1200
      ? MediaQuery.sizeOf(Get.context!).width * 0.2
      : MediaQuery.sizeOf(Get.context!).width * 0.22;
}

class HomePageController extends HomePageControllerAbstract
    with HomePageSearchController {
  updateIndexForSpecial(int index) {
    currentIndex.value = index;
  }

  @override
  initializeUserData() {
    userId = myServices.sharedPref.getInt("user_id");
    userName = myServices.sharedPref.getString("user_name");
    email = myServices.sharedPref.getString("user_email");
    phone = myServices.sharedPref.getString("user_phone");
    password = myServices.sharedPref.getString("user_password");
  }

  @override
  void onInit() async {
    await getData();
    initializeUserData();
    scrollController = ScrollController();

    scrollController.addListener(() {
      double offset = scrollController.offset;

      int newIndex = (offset / (cardWidth + 5)).round();

      if (newIndex != currentIndex.value) {
        updateIndexForSpecial(newIndex);
      }
    });

    super.onInit();
  }

  @override
  switchFavorite() {
    isFavorite = !isFavorite;
    update();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await homepageData.homepageRequest();
    statusRequest = handlingStatusRequest(response);
    update();

    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        categories.addAll(response["categories"]);
        items.addAll(response["items"]);
        itemsDiscount.addAll(response["items_discount"]);
        List topItemsData = response["topItems"];
        topSelling.addAll(topItemsData.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  gotoItems(selectedCateg) {
    Get.toNamed(AppRoutes.items, arguments: {
      "categories": categories,
      "selectedCateg": selectedCateg,
    });
  }

  @override
  openItemDetail(itemModel) {
    Get.toNamed(AppRoutes.itemDetails, arguments: {
      "item": itemModel,
    });
  }
}

mixin HomePageSearchController implements GetxController {
  List<ItemsModel> searchItemsList = [];
  bool isSearch = false;
  StatusRequest statusRequest = StatusRequest.none;
  TextEditingController searchCtrl = TextEditingController();
  HomePageData homepageData = HomePageData();

  checkSearch(val) {
    if (val.isEmpty && isSearch) {
      isSearch = false;
      statusRequest = StatusRequest.none;
      update();
    }
  }

  getSearchItems(search) async {
    update();
    var response = await homepageData.searchRequest(search);
    statusRequest = handlingStatusRequest(response);
    update();
    searchItemsList.clear();

    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        List data = response["data"];
        searchItemsList.addAll(data.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  dynamic onSearch() {
    if (searchCtrl.text.isNotEmpty) {
      isSearch = true;
      searchItemsList.clear();
      getSearchItems(searchCtrl.text);
    }
  }

  void resetStatus() {
    statusRequest = StatusRequest.none;
    update();
  }
}
