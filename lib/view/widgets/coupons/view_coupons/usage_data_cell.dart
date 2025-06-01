import 'package:adminapp/controller/coupons/view_coupons_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsageDataCell extends GetView<ViewCouponsController> {
  final int couponId;
  const UsageDataCell({super.key, required this.couponId});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,

        children: [
          InkWell(onTap: () {}, child: Icon(Icons.edit, size: 15)),
          SizedBox(width: 16),
          InkWell(
            onTap: () {
              controller.deleteCoupon(couponId);
            },
            child: Icon(Icons.delete, size: 15),
          ),
        ],
      ),
    );
  }
}
