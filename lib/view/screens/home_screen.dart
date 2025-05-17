import 'package:ecommerceapp/controller/homescreen_controller.dart';
import 'package:ecommerceapp/core/functions/alert_exit.dart';
import 'package:ecommerceapp/core/screen_dimensions.dart';
import 'package:ecommerceapp/view/widgets/homeScreen/navigation_bottom.dart';
import 'package:ecommerceapp/view/widgets/homeScreen/floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme myColors = Theme.of(context).colorScheme;
    HomeScreenController controller = Get.put(HomeScreenController());
    // LocaleController localeController = Get.find(); // هات الكونترولر بتاع اللغة

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) => alertExit(context),
      child: Obx(
        () {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            body: controller.pagesList.elementAt(controller.currentIndex.value),
            floatingActionButton: Responsible.isMobile(context)
                ? MyFloatingActionButton(
                    controller: controller, mycolors: myColors)
                : null,
            bottomNavigationBar: Responsible.isMobile(context)
                ? CustomBottomAppBar(myColors: myColors)
                : null,
          );
        },
      ),
    );
  }
}
