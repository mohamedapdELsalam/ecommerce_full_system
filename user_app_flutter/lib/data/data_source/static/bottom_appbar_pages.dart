import 'package:ecommerceapp/controller/cart_controller.dart';
import 'package:ecommerceapp/controller/offer_controller.dart';
import 'package:ecommerceapp/core/constants/lang_keys.dart';
import 'package:ecommerceapp/data/model/naviagtion_button_model.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

OffersController offerController = Get.find();

List<NavigationButtonModel> navigationButtonsList = [
  NavigationButtonModel("home", Icons.home, () {}),
  NavigationButtonModel(LangKeys.offers, Icons.shopify_sharp, () async {
    await offerController.getOffers();
  }),
  NavigationButtonModel(LangKeys.cart, Icons.shopping_bag, () async {
    CartController cartController = Get.find();

    Get.put(CartController());
    await cartController.getCartItems();
    print("run run ------------------------------ run run");
    print("run run run run");
  }),
  NavigationButtonModel(LangKeys.profile, Icons.person, () {}),
  NavigationButtonModel(LangKeys.settings, Icons.settings, () {}),
];
