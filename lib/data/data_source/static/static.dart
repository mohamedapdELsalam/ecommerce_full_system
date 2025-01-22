import 'package:ecommerceapp/core/constants/image_assets.dart';
import 'package:ecommerceapp/data/model/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
      title: "8".tr,
      body: "9".tr,
      image: LottiesAssets.smoozyCart,
      backGroundColor: Colors.white),
  OnBoardingModel(
      title: "10".tr,
      body: "11".tr,
      image: LottiesAssets.smoozyCart,
      backGroundColor: Colors.orange),
  OnBoardingModel(
      title: "12".tr,
      body: "13".tr,
      image: LottiesAssets.smoozyCart,
      backGroundColor: Colors.deepPurple),
];
List<SpecialForYouModel> SpecialForYouList = [
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
