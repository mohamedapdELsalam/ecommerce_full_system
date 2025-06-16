import 'package:ecommerceapp/controller/homescreen_controller.dart';
import 'package:ecommerceapp/data/data_source/static/bottom_appbar_pages.dart';
import 'package:ecommerceapp/view/widgets/homeScreen/navigation_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomAppBar extends GetView<HomeScreenController> {
  const CustomBottomAppBar({
    super.key,
    required this.myColors,
  });

  final ColorScheme myColors;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6,
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
        height: 50,
        color: myColors.onPrimary,
        child: Row(
          children: [
            ...List.generate(navigationButtonsList.length + 1, (index) {
              int i = index > 2 ? index - 1 : index;
              return index == 3
                  ? Spacer()
                  : index > 0
                      ? BottomAppbarButton(
                          isActive: controller.currentIndex.value == i,
                          title: navigationButtonsList[i].title.tr,
                          icon: navigationButtonsList[i].icon,
                          onPressed: () {
                            if (controller.currentIndex.value != i) {
                              navigationButtonsList[i].onPressed!();
                              controller.changePage(i);

                              print("shehta shehta -----");
                            }
                          },
                        )
                      : Container();
            })
          ],
        ));
  }
}
