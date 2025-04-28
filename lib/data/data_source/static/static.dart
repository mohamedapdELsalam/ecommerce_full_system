import 'package:adminapp/controller/orders_controller.dart';
import 'package:adminapp/core/constants/app_routes.dart';
import 'package:adminapp/core/constants/image_assets.dart';
import 'package:adminapp/core/services/services.dart';
import 'package:adminapp/data/model/control_panel_model.dart';
import 'package:adminapp/data/model/naviagtion_button_model.dart';
import 'package:adminapp/data/model/onboarding_model.dart';
import 'package:adminapp/data/model/profile_model.dart';
import 'package:adminapp/data/model/settings_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

MyServices myServices = Get.find();
OrdersController orderController = Get.put(OrdersController());

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
    title: "8".tr,
    body: "9".tr,
    image: LottiesAssets.smoozyCart,
    backGroundColor: Colors.white,
  ),
  OnBoardingModel(
    title: "10".tr,
    body: "11".tr,
    image: LottiesAssets.smoozyCart,
    backGroundColor: Colors.orange,
  ),
  OnBoardingModel(
    title: "12".tr,
    body: "13".tr,
    image: LottiesAssets.smoozyCart,
    backGroundColor: Colors.deepPurple,
  ),
];
List<ControlPanelCardModel> controlPanelList = [
  ControlPanelCardModel(title: "products", url: SvgAssets.jacket, onTap: () {}),
  ControlPanelCardModel(
    title: "orders",
    url: SvgAssets.boxes,
    onTap: () {
      Get.toNamed(AppRoutes.pendingOrders);
    },
  ),
  ControlPanelCardModel(title: "coupons", url: SvgAssets.coupons, onTap: () {}),
  ControlPanelCardModel(
    title: "categories",
    url: SvgAssets.yellowCateg,
    onTap: () {
      Get.toNamed(AppRoutes.categories);
    },
  ),
  ControlPanelCardModel(
    title: "notifications",
    url: SvgAssets.purpleNotification,
    onTap: () {},
  ),
  ControlPanelCardModel(title: "users", url: SvgAssets.cash, onTap: () {}),
  ControlPanelCardModel(
    title: "statistics",
    url: SvgAssets.redStatictis,
    onTap: () {},
  ),
];

List<NavigationButtonModel> navigationButtonsList = [
  NavigationButtonModel("home".tr, Icons.home, () {}),
  // NavigationButtonModel("offers".tr, Icons.shopify_sharp, () async {}),
  // NavigationButtonModel("cart".tr, Icons.shopping_bag, () async {}),
  // NavigationButtonModel("profile".tr, Icons.person, () {}),
  // NavigationButtonModel("settings".tr, Icons.settings, () {}),
  NavigationButtonModel("archive".tr, Icons.archive, () {}),
  NavigationButtonModel("settings".tr, Icons.settings, () {}),
];

List<SettingOptionModel> settingOptionsList = [
  SettingOptionModel(
    title: "language",
    subtitle: "english",
    onTap: () {},
    trailing: Icon(Icons.language),
  ),
  SettingOptionModel(
    title: "notification",
    subtitle: "stopped",
    onTap: () {},
    trailing: Switch(value: false, onChanged: (val) {}),
  ),
  SettingOptionModel(
    title: "addresses",
    subtitle: "add you address",
    onTap: () {
      Get.toNamed(AppRoutes.addressView);
    },
    trailing: Icon(Icons.location_pin),
  ),
  SettingOptionModel(
    title: "theme",
    subtitle: "dark",
    onTap: () {},
    trailing: Switch(value: true, onChanged: (val) {}),
  ),
  SettingOptionModel(
    title: "about us",
    subtitle: "about us",
    onTap: () {},
    trailing: Icon(Icons.info),
  ),
  SettingOptionModel(
    title: "contact us",
    subtitle: "whatsapp - call",
    onTap: () {
      Get.toNamed(AppRoutes.contact);
    },
    trailing: Icon(Icons.phone),
  ),
  SettingOptionModel(
    title: "log out",
    subtitle: "goodby",
    onTap: () {
      Get.defaultDialog(
        title: "warn",
        content: Text("do you agreed to logging out ?"),
        onConfirm: () {
          myServices.sharedPref.clear();
          Get.offAllNamed(AppRoutes.login);
        },
        onCancel: () {},
      );
    },
    trailing: Icon(Icons.exit_to_app, color: Colors.red[900]),
  ),
];

List<ProfileModel> profileList = [
  ProfileModel(
    title: "orders",
    subtitle: "pending and archive",
    onTap: () {
      Get.toNamed(AppRoutes.pendingOrders);
    },
    trailing: Icon(Icons.shop),
  ),
  ProfileModel(
    title: "information",
    subtitle: "stopped",
    onTap: () {},
    trailing: Icon(Icons.info_rounded),
  ),
  ProfileModel(
    title: "addresses",
    subtitle: "add you address",
    onTap: () {
      Get.toNamed(AppRoutes.addressView);
    },
    trailing: Icon(Icons.location_pin),
  ),
];

String onboardingButtonText = "13".tr;
String onboardingLastButtonText = "14".tr;
String loginTitle = "1".tr;
String loginSubtitle = "15".tr;
String signUpTitle = "1".tr;
String signUpSubtitle = "40".tr;
String verifyTitle = "16".tr;
String verifySubtitle = "17".tr;
String successResetPasswordTitle = "18".tr;
String successResetPasswordSubtitle = "19".tr;
String successSignUpTitle = "25".tr;
String successSignUpSubtitle = "26".tr;
String appName = "45".tr;
