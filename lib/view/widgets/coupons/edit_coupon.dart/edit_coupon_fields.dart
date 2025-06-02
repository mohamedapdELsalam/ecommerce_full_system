import 'package:adminapp/controller/coupons/edit_coupon_controller.dart';
import 'package:adminapp/core/functions/validate_inputs.dart';
import 'package:adminapp/core/shared/global_textform.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditCouponFields extends GetView<EditCouponController> {
  const EditCouponFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          GlobalTextForm(
            hint: "type code",
            prefix: "code",
            controller: controller.codeCtrl,
            validator: (val) {
              return validate(val!, 4, 30, "text", controller);
            },
          ),
          SizedBox(height: 25),
          GlobalTextForm(
            isNumber: true,
            hint: "type discount",
            prefix: "discount",
            controller: controller.discountCtrl,
            validator: (val) {
              return validate(val!, 1, 2, "number", controller);
            },
          ),
          SizedBox(height: 25),
          GlobalTextForm(
            isNumber: true,
            hint: "enter usage limit",
            prefix: "usage limit",
            controller: controller.countCtrl,
            validator: (val) {
              return validate(val!, 1, 4, "number", controller);
            },
          ),
          SizedBox(height: 25),
          GlobalTextForm(
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );
              String formData =
                  "${pickedDate!.year}/${pickedDate.month}/${pickedDate.day}";
              controller.expirationCtrl.text = formData;
            },

            hint: "enter expiration date",
            prefix: "expiration date",
            controller: controller.expirationCtrl,
            validator: (val) {
              return validate(val!, 5, 12, "date", controller);
            },
          ),
        ],
      ),
    );
  }
}
