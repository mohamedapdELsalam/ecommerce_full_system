import 'package:adminapp/controller/items/add_item_controller.dart';
import 'package:adminapp/core/functions/validate_inputs.dart';
import 'package:adminapp/core/shared/global_textform.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductVariantsBlock extends GetView<AddItemController> {
  const AddProductVariantsBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddItemController>(
      builder:
          (controller) =>
              controller.isHaveVariants
                  ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 12),
                      Text(
                        "product variants",
                        style: TextTheme.of(context).titleSmall!.copyWith(
                          color: ColorScheme.of(context).primary,
                        ),
                      ),
                      SizedBox(height: 15),
                      GlobalTextForm(
                        multiLines: true,
                        prefix: "product color",

                        hint: "product color",
                        controller: controller.descArCtrl,
                        validator: (val) {
                          return validate(val!, 10, 200, "text", controller);
                        },
                      ),
                      SizedBox(height: 10),
                      GlobalTextForm(
                        multiLines: true,
                        prefix: "product sized",

                        hint: "product size ",
                        controller: controller.descEnCtrl,
                        validator: (val) {
                          return validate(val!, 10, 200, "text", controller);
                        },
                      ),
                      SizedBox(height: 10),
                      GlobalTextForm(
                        multiLines: true,
                        prefix: "product count",

                        hint: "product count ",
                        controller: controller.descDeCtrl,
                        validator: (val) {
                          return validate(val!, 10, 200, "text", controller);
                        },
                      ),
                      SizedBox(height: 10),
                      GlobalTextForm(
                        multiLines: true,
                        prefix: "product price",
                        hint: "product price (spain)",
                        controller: controller.descSpCtrl,
                        validator: (val) {
                          return validate(val!, 10, 200, "text", controller);
                        },
                      ),
                    ],
                  )
                  : Text(""),
    );
  }
}
