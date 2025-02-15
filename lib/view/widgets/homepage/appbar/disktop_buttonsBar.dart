import 'package:ecommerceapp/controller/homescreen_controller.dart';
import 'package:ecommerceapp/data/data_source/static/static.dart';
import 'package:ecommerceapp/view/widgets/homepage/appbar/appbar_disktop.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppbarDisktopButtonsBar extends GetView<HomeScreenController> {
  const AppbarDisktopButtonsBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme myColors = Theme.of(context).colorScheme;
    return Row(
      children: [
        ...List.generate(
          navigationButtonsList.length,
          (i) => AppbarDisktopButton(
            title: navigationButtonsList[i].title,
            myColors: myColors,
            onpressed: () {
              controller.changePage(i);
            },
          ),
        )
      ],
    );
  }
}
