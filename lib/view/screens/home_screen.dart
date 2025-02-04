import 'package:ecommerceapp/controller/homescreen_controller.dart';
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
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: controller.pagesList.elementAt(controller.currentIndex.value),
        floatingActionButton: Responsible.isMobile(context)
            ? MyFloatingActionButton(controller: controller, mycolors: mycolors)
            : null,
        bottomNavigationBar: Responsible.isMobile(context)
            ? CustomBottomAppBar(mycolors: mycolors)
            : null,
      ),
    );
  }
}
