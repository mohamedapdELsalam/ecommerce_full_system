import 'package:adminapp/controller/coupons/add_coupon_controller.dart';
import 'package:adminapp/core/shared/main_global_button.dart';
import 'package:adminapp/view/widgets/coupons/add_coupon.dart/add_coupon_fields.dart';
import 'package:adminapp/view/widgets/coupons/add_coupon.dart/add_coupon_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCoupon extends StatelessWidget {
  const AddCoupon({super.key});
  @override
  Widget build(BuildContext context) {
    AddCouponController controller = Get.put(AddCouponController());
    return Scaffold(
      appBar: AppBar(title: Text("add coupon")),
      body: ListView(
        children: [
          Card(
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  AddCouponFields(),
                  SizedBox(height: 50),
                  AddCouponLoading(),
                  GlobalButton(
                    onPressed: () {
                      controller.addCoupon();
                    },
                    title: "Add Coupon",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
