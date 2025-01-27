import 'package:ecommerceapp/controller/auth/login_controller.dart';
import 'package:ecommerceapp/core/class/status_request.dart';
import 'package:ecommerceapp/core/functions/handlindStatusRequest.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/data_source/remote/homepage_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomePageControllerAbstract extends GetxController {
  LoginController loginController = Get.put(LoginController());
  MyServices myServices = Get.find();
  initializeUserData();
  switchFavorite();
  getData();
  HomePageData homepageData = HomePageData();
  StatusRequest statusRequest = StatusRequest.none;
  List categories = [];
  List items = [];
  List items_discount = [];
  int? userId;
  String? userName;
  String? email;
  String? phone;
  String? password;
  RxInt currentIndex = 0.obs;
  late ScrollController scrollcontroller;
  bool isFavorite = false;
}

class HomePageController extends HomePageControllerAbstract {
  updateIndexForSpeical(int index) {
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
    scrollcontroller = ScrollController();

    scrollcontroller.addListener(() {
      double offset = scrollcontroller.offset;

      int newIndex = (offset / (Get.size.width * 0.8 + 20)).round();

      if (newIndex != currentIndex.value) {
        updateIndexForSpeical(newIndex);
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
    statusRequest = handlindStatusRequest(response);
    update();

    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        categories.addAll(response["categories"]);
        items.addAll(response["items"]);
        items_discount.addAll(response["items_discount"]);
        update();
      } else {
        statusRequest = StatusRequest.failure;
        update();
      }
    }
    update();
  }
}
