import 'package:adminapp/controller/products/edit_product_controller.dart';
import 'package:adminapp/core/functions/validate_inputs.dart';
import 'package:adminapp/core/shared/global_textform.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProductDescBlock extends GetView<EditProductController> {
  const EditProductDescBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text(
          "product discription",
          style: TextTheme.of(
            context,
          ).titleSmall!.copyWith(color: ColorScheme.of(context).primary),
        ),
        SizedBox(height: 10),
        GlobalTextForm(
          hint: "product discription (arabic)",
          controller: controller.descArCtrl,
          validator: (val) {
            return validate(val!, 5, 200, "text", controller);
          },
        ),
        SizedBox(height: 10),
        GlobalTextForm(
          hint: "product discription (english)",
          controller: controller.descEnCtrl,
          validator: (val) {
            return validate(val!, 5, 200, "text", controller);
          },
        ),
        SizedBox(height: 10),
        GlobalTextForm(
          hint: "product discription (deutsche)",
          controller: controller.descDeCtrl,
          validator: (val) {
            return validate(val!, 5, 200, "text", controller);
          },
        ),
        SizedBox(height: 10),
        GlobalTextForm(
          hint: "product discription (spain)",
          controller: controller.descSpCtrl,
          validator: (val) {
            return validate(val!, 5, 200, "text", controller);
          },
        ),
      ],
    );
  }
}
