import 'package:adminapp/controller/items/edit_item_controller.dart';
import 'package:adminapp/core/functions/validate_inputs.dart';
import 'package:adminapp/core/shared/global_textform.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProductNameBlock extends GetView<EditItemController> {
  const EditProductNameBlock({super.key});

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
          prefix: "name ar",

          hint: "product name (arabic)",
          controller: controller.ctrls.nameArCtrl,
          validator: (val) {
            return validate(val!, 2, 50, "text", controller);
          },
        ),
        SizedBox(height: 10),
        GlobalTextForm(
          prefix: "name en",

          hint: "product name (english)",
          controller: controller.ctrls.nameEnCtrl,
          validator: (val) {
            return validate(val!, 2, 50, "text", controller);
          },
        ),
        SizedBox(height: 10),
        GlobalTextForm(
          prefix: "name de",

          hint: "product name (deutsche)",
          controller: controller.ctrls.nameDeCtrl,
          validator: (val) {
            return validate(val!, 2, 50, "text", controller);
          },
        ),
        SizedBox(height: 10),
        GlobalTextForm(
          prefix: "name sp",

          hint: "product name (spain)",
          controller: controller.ctrls.nameSpCtrl,
          validator: (val) {
            return validate(val!, 2, 50, "text", controller);
          },
        ),
      ],
    );
  }
}
