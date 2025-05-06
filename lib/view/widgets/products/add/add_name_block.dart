import 'package:adminapp/controller/products/add_product_controller.dart';
import 'package:adminapp/core/functions/validate_inputs.dart';
import 'package:adminapp/core/shared/global_textform.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductNameBlock extends GetView<AddProductController> {
  const AddProductNameBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text(
          "product Name",
          style: TextTheme.of(
            context,
          ).titleSmall!.copyWith(color: ColorScheme.of(context).primary),
        ),
        SizedBox(height: 10),
        GlobalTextForm(
          hint: "product name (arabic)",
          controller: controller.nameArCtrl,
          validator: (val) {
            return validate(val!, 3, 50, "text", controller);
          },
        ),
        SizedBox(height: 10),
        GlobalTextForm(
          hint: "product name (english)",
          controller: controller.nameEnCtrl,
          validator: (val) {
            return validate(val!, 3, 50, "text", controller);
          },
        ),
        SizedBox(height: 10),
        GlobalTextForm(
          hint: "product name (deutsche)",
          controller: controller.nameDeCtrl,
          validator: (val) {
            return validate(val!, 3, 50, "text", controller);
          },
        ),
        SizedBox(height: 10),
        GlobalTextForm(
          hint: "product name (spain)",
          controller: controller.nameSpCtrl,
          validator: (val) {
            return validate(val!, 3, 50, "text", controller);
          },
        ),
      ],
    );
  }
}
