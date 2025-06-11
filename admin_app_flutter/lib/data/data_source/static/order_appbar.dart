import 'package:adminapp/core/constants/lang_keys.dart';
import 'package:adminapp/data/model/naviagtion_button_model.dart';
import 'package:flutter/material.dart';

List<NavigationButtonModel> ordersBottomAppbarList = [
  NavigationButtonModel(LangKeys.pendingOrders, Icons.home, () {}),
  NavigationButtonModel(LangKeys.accepted, Icons.shopify_sharp, () async {}),
  NavigationButtonModel(LangKeys.archiveOrders, Icons.shopping_bag, () async {}),
];
