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
    ColorScheme mycolors = Theme.of(context).colorScheme;
    HomeScreenController controller = Get.put(HomeScreenController());
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) =>  alertExit(
                context, "warn ", " do you want to exit ?", "exit", "cancel"),
      child: Obx(
        () => Scaffold(
          resizeToAvoidBottomInset: false,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          body: controller.pagesList.elementAt(controller.currentIndex.value),
          floatingActionButton: Responsible.isMobile(context)
              ? MyFloatingActionButton(
                  controller: controller, mycolors: mycolors)
              : null,
          bottomNavigationBar: Responsible.isMobile(context)
              ? CustomBottomAppBar(myColors: mycolors)
              : null,
        ),
      ),
    );
  }
}
