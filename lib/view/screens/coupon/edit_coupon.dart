import 'package:adminapp/controller/coupons/edit_coupon_controller.dart';
import 'package:adminapp/core/constants/lang_keys.dart';
import 'package:adminapp/core/shared/main_global_button.dart';
import 'package:adminapp/view/widgets/coupons/edit_coupon.dart/edit_coupon_fields.dart';
import 'package:adminapp/view/widgets/coupons/edit_coupon.dart/edit_coupon_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditCoupon extends StatelessWidget {
  const EditCoupon({super.key});
  @override
  Widget build(BuildContext context) {
    EditCouponController controller = Get.put(EditCouponController());
    return Scaffold(
      appBar: AppBar(title: Text("edit coupon")),
      body: ListView(
        children: [
          Card(
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  EditCouponFields(),
                  SizedBox(height: 50),
                  EditCouponLoading(),
                  GlobalButton(
                    onPressed: () {
                      controller.editCoupon();
                    },
                    title: LangKeys.save.tr,
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
