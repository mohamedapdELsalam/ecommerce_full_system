import 'package:ecommerceapp/controller/homescreen_controller.dart';
import 'package:ecommerceapp/view/widgets/homeScreen/bottom_appbar_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomAppBar extends GetView<HomeScreenController> {
  const CustomBottomAppBar({
    super.key,
    required this.mycolors,
  });

  final ColorScheme mycolors;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 6,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
      height: 55,
      color: mycolors.onPrimary,
      child: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                BottomAppbarButton(
                  onpressed: () {
                    controller.changePage(1);
                  },
                  icon: Icons.shopping_bag,
                  title: "cart",
                  isActive: controller.currentIndex == 1 ? true : false,
                ),
                BottomAppbarButton(
                  onpressed: () {
                    controller.changePage(2);
                  },
                  icon: Icons.person,
                  title: "profile",
                  isActive: controller.currentIndex == 2 ? true : false,
                ),
                Expanded(flex: 1, child: SizedBox()),
              ],
            ),
          ),
          SizedBox(
            width: 70,
          ),
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BottomAppbarButton(
                  onpressed: () {
                    controller.changePage(3);
                  },
                  icon: Icons.settings,
                  title: "settings",
                  isActive: controller.currentIndex == 3 ? true : false,
                ),
                Expanded(flex: 1, child: SizedBox()),
                BottomAppbarButton(
                  onpressed: () {
                    controller.changePage(4);
                  },
                  icon: Icons.favorite,
                  title: "favorite",
                  isActive: controller.currentIndex == 4 ? true : false,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
