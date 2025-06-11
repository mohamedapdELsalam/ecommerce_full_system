import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SettingsControllerAbstract extends GetxController {
  bool darkTheme = Get.isDarkMode;
  void changeTheme();
}

class SettingsController extends SettingsControllerAbstract {
  @override
  void changeTheme() {
    if (darkTheme) {
      Get.changeThemeMode(ThemeMode.light);
    } else {
      Get.changeThemeMode(ThemeMode.dark);
    }
    darkTheme = !darkTheme;
    update();
  }
}
