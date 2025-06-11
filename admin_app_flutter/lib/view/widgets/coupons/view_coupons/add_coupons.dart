import 'package:adminapp/controller/coupons/view_coupons_controller.dart';
import 'package:adminapp/core/constants/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TitleAndAddCoupon extends GetView<ViewCouponsController> {
  const TitleAndAddCoupon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Text("Coupons", style: context.textTheme.titleLarge),
          Spacer(),
          MaterialButton(
            color: Colors.blueGrey,
            onPressed: () async {
              String result = await Get.toNamed(AppRoutes.addCoupon);
              if (result == "refresh") {
                await controller.getCoupons();
              }
            },
            child: Text("add coupon"),
          ),
        ],
      ),
    );
  }
}
