import 'package:ecommerceapp/controller/offer_controller.dart';
import 'package:ecommerceapp/core/class/handlind_status_request.dart';
import 'package:ecommerceapp/core/screen_dimensions.dart';
import 'package:ecommerceapp/view/widgets/homepage/appbar/appbar_disktop.dart';
import 'package:ecommerceapp/view/widgets/offers/appbar_offers.dart';
import 'package:ecommerceapp/view/widgets/offers/offers_gridview.dart';
import 'package:ecommerceapp/view/widgets/search_results.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(OffersController());
    // double appHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
        children: [
          Responsible(mobile: AppbarOffers(), desktop: AppBardesktop()),
          GetBuilder<OffersController>(
            builder: (controller) => HandlingStatusRequestWithData(
              statusRequest: controller.statusRequest,
              widget: controller.isSearch
                  ? SearchResults(itemsList: controller.searchItemsList)
                  : OffersItemsGridView(),
            ),
          )
        ],
      ),
    );
  }
}
