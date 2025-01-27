import 'package:ecommerceapp/controller/homescreen_controller.dart';
import 'package:ecommerceapp/view/widgets/homeScreen/bottom_appbar.dart';
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
        body: controller.pagesList.elementAt(controller.currentIndex.value),
        floatingActionButton: FloatingActionButton(
          backgroundColor: controller.currentIndex == 0
              ? mycolors.primary
              : mycolors.onPrimary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          child: Icon(
            Icons.home,
            color: controller.currentIndex == 0
                ? mycolors.onPrimary
                : mycolors.onSecondary,
          ),
          onPressed: () {
            controller.changePage(0);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: CustomBottomAppBar(mycolors: mycolors),
      ),
    );
  }
}
