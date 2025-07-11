import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/core/themes/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SettingsControllerAbstract extends GetxController {
  bool? darkTheme;
  void changeTheme();
  MyServices myServices = Get.find();
}

class SettingsController extends SettingsControllerAbstract {
  @override
  void onInit() {
    darkTheme = myServices.sharedPref.getString("theme") == "dark";
    super.onInit();
  }

  @override
  void changeTheme() {
    if (darkTheme!) {
      Get.changeThemeMode(ThemeMode.light);
      myServices.sharedPref.setString("theme", "light");
    } else {
      Get.changeThemeMode(ThemeMode.dark);
      myServices.sharedPref.setString("theme", "dark");
    }
    darkTheme = !darkTheme!;
    update();
  }
}
