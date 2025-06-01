import 'package:adminapp/controller/coupons/add_coupon_controller.dart';
import 'package:adminapp/core/class/handlind_status_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCouponLoading extends StatelessWidget {
  const AddCouponLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddCouponController>(
      builder:
          (controller) => HandlingStatusRequest(
            statusRequest: controller.statusRequest,
            widget: Text(""),
            controller: controller,
          ),
    );
  }
}
