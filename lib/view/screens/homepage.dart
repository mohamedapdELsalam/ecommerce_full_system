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
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/homepage/appbar/appbar_mobile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double appHeight = MediaQuery.of(context).size.height;

    // HomePageController controller =
    Get.put(HomePageController());

    return GetBuilder<HomePageController>(
      builder: (controller) => HandlingStatusRequest(
        statusRequest: controller.statusRequest,
        widget: SingleChildScrollView(
          child: Column(
            children: [
              const Responsible(
                  mobile: AppbarHomepage(), desktop: AppBardesktop()),
              SizedBox(height: appHeight * 0.01),
              const SpecialTitle(),
              const SpecialListview(),
              const SliderIndicatorHomePage(),
              const CategoriesTitle(),
              const CategroiesListView(),
              const MostSellProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
