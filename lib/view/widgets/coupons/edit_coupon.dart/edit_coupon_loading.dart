import 'package:adminapp/controller/coupons/edit_coupon_controller.dart';
import 'package:adminapp/core/class/handlind_status_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditCouponLoading extends StatelessWidget {
  const EditCouponLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditCouponController>(
      builder:
          (controller) => HandlingStatusRequest(
            statusRequest: controller.statusRequest,
            widget: Text(""),
            controller: controller,
          ),
    );
  }
}
