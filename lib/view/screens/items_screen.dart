import 'package:ecommerceapp/controller/items/items_controller.dart';
import 'package:ecommerceapp/core/class/handlind_status_request.dart';
import 'package:ecommerceapp/core/screen_dimensions.dart';
import 'package:ecommerceapp/view/widgets/homepage/appbar/appbar_disktop.dart';
import 'package:ecommerceapp/view/widgets/homepage/appbar/appbar_mobile.dart';
import 'package:ecommerceapp/view/widgets/items/items_categories_bar.dart';
import 'package:ecommerceapp/view/widgets/items/products_gridview.dart';
import 'package:ecommerceapp/view/widgets/search_results.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ItemsController());
    double appHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Responsible(mobile: AppbarHomepage(), desktop: AppBardesktop()),
            GetBuilder<ItemsController>(
                builder: (controller) => !controller.isSearch
                    ? Column(
                        children: [
                          SizedBox(height: appHeight * 0.02),
                          ItemsCategoriesBar(),
                        ],
                      )
                    : Text("")),
            GetBuilder<ItemsController>(
              builder: (controller) => HandlingStatusRequestWithData(
                statusRequest: controller.statusRequest,
                widget: controller.isSearch
                    ? SearchResults(itemsList: controller.searchItemsList)
                    : ProductsGridView(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
