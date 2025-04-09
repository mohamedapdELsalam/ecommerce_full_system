import 'package:ecommerceapp/controller/offer_controller.dart';
import 'package:ecommerceapp/view/widgets/homepage/appbar/appbar_mobile_bottom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomAppbarOffers extends StatelessWidget {
  const BottomAppbarOffers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    OffersController controller = Get.find();
    return Container(
      child: Row(
        children: [
          Expanded(
              flex: 7,
              child: SearchFieldAppBar(
                searchCtrl: controller.searchCtrl,
                onChanged: (val) {
                  controller.checkSearch(val);
                },
                onSearch: () {
                  controller.onSearch();
                },
                hint: "46".tr,
              )),
          Expanded(
            flex: 2,
            child: SizedBox(),
          )
        ],
      ),
    );
  }
}
