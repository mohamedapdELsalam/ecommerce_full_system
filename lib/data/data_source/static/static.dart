import 'package:ecommerceapp/controller/cart_controller.dart';
import 'package:ecommerceapp/controller/favorite_controller.dart';
import 'package:ecommerceapp/controller/offer_controller.dart';
import 'package:ecommerceapp/core/constants/app_routes.dart';
import 'package:ecommerceapp/core/constants/image_assets.dart';
import 'package:ecommerceapp/core/constants/lang_keys.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/model/naviagtion_button_model.dart';
import 'package:ecommerceapp/data/model/onboarding_model.dart';
import 'package:ecommerceapp/data/model/profile_model.dart';
import 'package:ecommerceapp/data/model/settings_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

MyServices myServices = Get.find();
CartController cartController = Get.find();
OffersController offerController = Get.find();
FavoriteController favController = Get.find();

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
      title: LangKeys.onBoardingTitle1.tr,
      body: LangKeys.onBoardingBody1.tr,
      image: LottiesAssets.smoozyCart,
      backGroundColor: Colors.white),
  OnBoardingModel(
      title: LangKeys.onBoardingTitle2.tr,
      body: LangKeys.onBoardingBody2.tr,
      image: LottiesAssets.smoozyCart,
      backGroundColor: Colors.orange),
  OnBoardingModel(
      title: LangKeys.onBoardingTitle3.tr,
      body: LangKeys.onBoardingBody3.tr,
      image: LottiesAssets.smoozyCart,
      backGroundColor: Colors.deepPurple),
];
List<SpecialForYouModel> specialForYouList = [
  SpecialForYouModel(
    title: "8".tr,
    body: "9".tr,
    image: ImageAssets.specialOffer4,
  ),
  SpecialForYouModel(
    title: "10".tr,
    body: "11".tr,
    image: ImageAssets.BlackFriday,
  ),
  SpecialForYouModel(
    title: "12".tr,
    body: "13".tr,
    image: ImageAssets.specialOffer3,
  ),
];
List<NavigationButtonModel> navigationButtonsList = [
  NavigationButtonModel("home".tr, Icons.home, () {}),
  NavigationButtonModel(LangKeys.offers.tr, Icons.shopify_sharp, () async {
    await offerController.getOffers();
  }),
  NavigationButtonModel(LangKeys.cart.tr, Icons.shopping_bag, () async {
    await cartController.getCartItems();
  }),
  NavigationButtonModel(LangKeys.profile.tr, Icons.person, () {}),
  NavigationButtonModel(LangKeys.settings.tr, Icons.settings, () {}),
];

List<SettingOptionModel> settingOptionsList = [
  SettingOptionModel(
    title: LangKeys.language.tr,
    subtitle: LangKeys.languageSub.tr,
    onTap: () {},
    trailing: Icon(
      Icons.language,
    ),
  ),
  SettingOptionModel(
    title: LangKeys.notification.tr,
    subtitle: LangKeys.notificationSub.tr,
    onTap: () {},
    trailing: Switch(value: false, onChanged: (val) {}),
  ),
  SettingOptionModel(
    title: LangKeys.address.tr,
    subtitle: LangKeys.addressesSub.tr,
    onTap: () {
      Get.toNamed(AppRoutes.addressView);
    },
    trailing: Icon(Icons.location_pin),
  ),
  SettingOptionModel(
    title: LangKeys.theme.tr,
    subtitle: LangKeys.themeSub.tr,
    onTap: () {},
    trailing: Switch(value: true, onChanged: (val) {}),
  ),
  SettingOptionModel(
    title: LangKeys.aboutUs.tr,
    subtitle: LangKeys.aboutUsSub.tr,
    onTap: () {},
    trailing: Icon(Icons.info),
  ),
  SettingOptionModel(
    title: LangKeys.contactUs.tr,
    subtitle: LangKeys.contactUsSub.tr,
    onTap: () {
      Get.toNamed(AppRoutes.contact);
    },
    trailing: Icon(Icons.phone),
  ),
  SettingOptionModel(
    title: LangKeys.logOut.tr,
    subtitle: LangKeys.logOutSub.tr,
    onTap: () {
      Get.defaultDialog(
        title: LangKeys.warn.tr,
        content: Text(LangKeys.logoutConfirmMsg.tr),
        onConfirm: () {
          myServices.sharedPref.clear();
          Get.offAllNamed(AppRoutes.login);
        },
        onCancel: () {},
      );
    },
    trailing: Icon(
      Icons.exit_to_app,
      color: Colors.red[900],
    ),
  ),
];

List<ProfileModel> profileList = [
  ProfileModel(
    title: LangKeys.orders.tr,
    subtitle: LangKeys.ordersSub.tr,
    onTap: () {
      Get.toNamed(AppRoutes.orders);
    },
    trailing: Icon(
      Icons.shop,
    ),
  ),
  ProfileModel(
    title: LangKeys.information.tr,
    subtitle: LangKeys.informationSub.tr,
    onTap: () {},
    trailing: Icon(Icons.info_rounded),
  ),
  ProfileModel(
    title: LangKeys.address.tr,
    subtitle: LangKeys.addressesSub.tr,
    onTap: () {
      Get.toNamed(AppRoutes.addressView);
    },
    trailing: Icon(Icons.location_pin),
  ),
];
