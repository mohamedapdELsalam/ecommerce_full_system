import 'package:adminapp/data/model/naviagtion_button_model.dart';
import 'package:flutter/material.dart';

List<NavigationButtonModel> navigationButtonsList = [
  NavigationButtonModel("home", Icons.home, () {}),
  // NavigationButtonModel("offers".tr, Icons.shopify_sharp, () async {}),
  // NavigationButtonModel("cart".tr, Icons.shopping_bag, () async {}),
  // NavigationButtonModel("profile".tr, Icons.person, () {}),
  // NavigationButtonModel("settings".tr, Icons.settings, () {}),
  NavigationButtonModel("archive", Icons.archive, () {}),
  NavigationButtonModel("settings", Icons.settings, () {}),
];
