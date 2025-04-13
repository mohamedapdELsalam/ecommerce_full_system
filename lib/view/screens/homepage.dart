import 'package:ecommerceapp/controller/homepage_controller.dart';
import 'package:ecommerceapp/core/class/handlind_status_request.dart';
import 'package:ecommerceapp/core/screen_dimensions.dart';
import 'package:ecommerceapp/view/widgets/homepage/appbar/appbar_disktop.dart';
import 'package:ecommerceapp/view/widgets/homepage/categories/categoriesTitle.dart';
import 'package:ecommerceapp/view/widgets/homepage/categories/categories_listview.dart';
import 'package:ecommerceapp/view/widgets/homepage/most_sell_products.dart';
import 'package:ecommerceapp/view/widgets/homepage/special/slider_indicator.dart';
import 'package:ecommerceapp/view/widgets/homepage/special/special_listview.dart';
import 'package:ecommerceapp/view/widgets/homepage/special/special_title.dart';
import 'package:ecommerceapp/view/widgets/search_results.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/homepage/appbar/appbar_mobile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageController());

    return SingleChildScrollView(
        child: Column(
      children: [
        Responsible(mobile: AppbarHomepage(), desktop: AppBardesktop()),
        GetBuilder<HomePageController>(
            builder: (controller) => HandlingStatusRequest(
                controller: controller,
                statusRequest: controller.statusRequest,
                widget: controller.isSearch
                    ? SearchResults(itemsList: controller.searchItemsList)
                    : Column(
                        children: const [
                          SpecialTitle(),
                          SpecialListView(),
                          SliderIndicatorHomePage(),
                          CategoriesTitle(),
                          CategoriesListView(),
                          TopSellingTitle(),
                          MostSellProducts(),
                        ],
                      )))
      ],
    ));
  }
}
