import 'package:ecommerceapp/controller/homepage_controller.dart';
import 'package:ecommerceapp/core/class/handlind_status_request.dart';
import 'package:ecommerceapp/view/screens/homepage_bottomBar.dart';
import 'package:ecommerceapp/view/widgets/homepage/categoriesTitle.dart';
import 'package:ecommerceapp/view/widgets/homepage/categories_listview.dart';
import 'package:ecommerceapp/view/widgets/homepage/homepage_gridview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/homepage/appbar/appbar_homepage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var myColors = Theme.of(context).colorScheme;
    var myTheme = Theme.of(context);
    var appHeight = Get.size.height;
    var appWidth = Get.size.width;

    // HomePageController controller =
    Get.put(HomePageController());

    return Scaffold(
        bottomNavigationBar: HomePageBottomBar(),
        body: GetBuilder<HomePageController>(
          builder: (controller) => HandlingStatusRequest(
            statusRequest: controller.statusRequest,
            widget: SingleChildScrollView(
              child: Column(
                children: [
                  appbarHomepage(),
                  SizedBox(height: appHeight * 0.05),
                  // SpecialTitle(myTheme: myTheme),
                  // SpecialListview(
                  //     appHeight: appHeight,
                  //     controller: controller,
                  //     appWidth: appWidth,
                  //     myColors: myColors),
                  // SliderIndicatorHomePage(),
                  CategoriesTitle(myTheme: myTheme),
                  CategroiesListView(
                      appWidth: appWidth,
                      appHeight: appHeight,
                      myColors: myColors),
                  GridViewHomepage(
                      appWidth: appWidth,
                      appHeight: appHeight,
                      myColors: myColors)
                ],
              ),
            ),
          ),
        ));
  }
}
