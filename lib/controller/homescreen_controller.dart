import 'package:ecommerceapp/view/screens/favorite_screen.dart';
import 'package:ecommerceapp/view/screens/cart_screen.dart';
import 'package:ecommerceapp/view/screens/homepage.dart';
import 'package:ecommerceapp/view/screens/profile_screen.dart';
import 'package:ecommerceapp/view/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenControllerImp extends GetxController {
  changePage(int index) {}

  RxInt currentIndex = 0.obs;
}

class HomeScreenController extends HomeScreenControllerImp {
  List<Widget> pagesList = [
    const HomePage(),
    const FavoriteScreen(),
    const CartScreen(),
    const ProfileScreen(),
    const SettingsScreen(),
  ];

  @override
  changePage(int index) {
    currentIndex.value = index;
    update();
  }
}
