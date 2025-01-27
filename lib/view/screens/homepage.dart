import 'package:ecommerceapp/controller/homepage_controller.dart';
import 'package:ecommerceapp/core/class/handlind_status_request.dart';
import 'package:ecommerceapp/view/widgets/homepage/categoriesTitle.dart';
import 'package:ecommerceapp/view/widgets/homepage/categories_listview.dart';
import 'package:ecommerceapp/view/widgets/homepage/products_gridview.dart';
import 'package:ecommerceapp/view/widgets/homepage/slider_indicator.dart';
import 'package:ecommerceapp/view/widgets/homepage/special_listview.dart';
import 'package:ecommerceapp/view/widgets/homepage/special_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/homepage/appbar/appbar_homepage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var myColors = Theme.of(context).colorScheme;
    var myTheme = Theme.of(context);
    double appHeight = MediaQuery.of(context).size.height;
    double appWidth = MediaQuery.of(context).size.width;

    // HomePageController controller =
    Get.put(HomePageController());

    return GetBuilder<HomePageController>(
      builder: (controller) => HandlingStatusRequest(
        statusRequest: controller.statusRequest,
        widget: SingleChildScrollView(
          child: Column(
            children: [
              AppbarHomepage(),
              SizedBox(height: appHeight * 0.01),
              SpecialTitle(myTheme: myTheme),
              SpecialListview(
                  appHeight: appHeight,
                  controller: controller,
                  appWidth: appWidth,
                  myColors: myColors),
              SliderIndicatorHomePage(),
              CategoriesTitle(myTheme: myTheme),
              CategroiesListView(
                  appWidth: appWidth, appHeight: appHeight, myColors: myColors),
              ProductsGridView(
                  appWidth: appWidth, appHeight: appHeight, myColors: myColors)
            ],
          ),
        ),
      ),
    );
  }
}
