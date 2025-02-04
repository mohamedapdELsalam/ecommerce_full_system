import 'package:ecommerceapp/controller/homescreen_controller.dart';
import 'package:ecommerceapp/data/data_source/static/static.dart';
import 'package:ecommerceapp/view/widgets/homeScreen/navigation_buttons.dart';
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
            ...List.generate(navigationButtonsList.length + 1, (index) {
              int i = index > 2 ? index - 1 : index;
              return index == 3
                  ? Spacer()
                  : index > 0
                      ? BottomAppbarButton(
                          isActive: controller.currentIndex == i,
                          title: navigationButtonsList[i].title,
                          icon: navigationButtonsList[i].icon,
                          onpressed: () {
                            controller.changePage(i);
                          },
                        )
                      : Container();
            })
          ],
        ));
  }
}
