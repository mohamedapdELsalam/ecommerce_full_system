import 'package:ecommerceapp/controller/auth/login_controller.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomePageControllerAbstract extends GetxController {
  LoginController loginController = Get.put(LoginController());
  MyServices myServices = Get.find();
  initializeUserData();
  switchFavorite();
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
  void onInit() {
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
}
