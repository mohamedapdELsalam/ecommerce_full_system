import 'package:ecommerceapp/controller/cart_controller.dart';
import 'package:ecommerceapp/controller/homescreen_controller.dart';
import 'package:ecommerceapp/data/data_source/static/static.dart';
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
     Get.put(CartController());
    return BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
        height: 55,
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
                          title: navigationButtonsList[i].title,
                          icon: navigationButtonsList[i].icon,
                          onPressed: () {
                            controller.changePage(i);
                            navigationButtonsList[i].onPressed!();
                            // if (controller.currentIndex.value != i) {
                            //   navigationButtonsList[i].onPressed!;
                            // }
                          },
                        )
                      : Container();
            })
          ],
        ));
  }
}
