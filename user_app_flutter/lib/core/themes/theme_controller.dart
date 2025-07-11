import 'package:ecommerceapp/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  ThemeMode? theme;
  MyServices myServices = Get.find();

  @override
  void onInit() {
    if (myServices.sharedPref.getString("theme") == "light") {
      theme = ThemeMode.light;
    } else if (myServices.sharedPref.getString("theme") == "dark") {
      theme = ThemeMode.dark;
    } else {
      theme = ThemeMode.system;
    }
    super.onInit();
  }
}
