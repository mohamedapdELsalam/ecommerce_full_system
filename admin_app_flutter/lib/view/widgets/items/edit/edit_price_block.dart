import 'package:adminapp/controller/items/edit_item_controller.dart';
import 'package:adminapp/core/class/variant_input.dart';
import 'package:adminapp/core/functions/validate_inputs.dart';
import 'package:adminapp/core/shared/global_textform.dart';
import 'package:adminapp/data/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProductPriceBlock extends GetView<EditItemController> {
  const EditProductPriceBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text(
          "product Price",
          style: TextTheme.of(
            context,
          ).titleSmall!.copyWith(color: ColorScheme.of(context).primary),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: GlobalTextForm(
                prefix: "price",
                isNumber: true,
                hint: "price",
                controller: controller.ctrls.priceCtrl,
                validator: (val) {
                  return validate(val!, 1, 10, "number", controller);
                },
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: GlobalTextForm(
                prefix: "discount",
                isNumber: true,
                hint: "discount (%)",
                controller: controller.ctrls.discountCtrl,
                validator: (val) {
                  return validate(val!, 1, 3, "number", controller);
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Text(
          "product status",
          style: TextTheme.of(
            context,
          ).titleSmall!.copyWith(color: ColorScheme.of(context).primary),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: GlobalTextForm(
                prefix: "quantity",
                isNumber: true,
                hint: "Quantity available",
                controller: controller.ctrls.quantityCtrl,
                validator: (val) {
                  return validate(val!, 1, 10, "text", controller);
                },
              ),
            ),

            SizedBox(width: 10),
            Expanded(
              child: GetBuilder<EditItemController>(
                builder:
                    (controller) => DropdownButtonFormField(
                      value: controller.selectedCategory,
                      validator: (value) {
                        if (value == null) {
                          return "choose category";
                        }
                        return null;
                      },
                      onTap: () {},
                      onSaved: (val) {
                        controller.selectedCategory = val;
                      },
                      hint: Text(
                        "choose category",
                        style: TextStyle(
                          color: ColorScheme.of(
                            context,
                          ).onSecondary.withAlpha(140),
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      padding: EdgeInsets.all(0),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        fillColor: ColorScheme.of(
                          context,
                        ).onPrimary.withAlpha(160),

                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            strokeAlign: 1,
                            width: 1,
                            color: const Color.fromARGB(87, 63, 62, 62),
                          ),
                        ),
                      ),
                      items: [
                        ...List.generate(controller.categories.length, (i) {
                          CategoryModel model = controller.categories[i];
                          return DropdownMenuItem(
                            value: model.categoriesId,
                            child: Text(
                              "${model.categoriesNameEn}",
                              style: TextTheme.of(context).bodyMedium!.copyWith(
                                color: ColorScheme.of(context).onSecondary,
                              ),
                            ),
                          );
                        }),
                      ],
                      onChanged: (val) {},
                    ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            GetBuilder<EditItemController>(
              builder:
                  (controller) => Row(
                    children: [
                      Transform.scale(
                        scale: 0.8,
                        child: Switch(
                          value: controller.isActive!,
                          onChanged: (val) {
                            controller.isActive = val;
                            controller.update();
                          },
                        ),
                      ),
                      Text(controller.isActive! ? "Active" : "inactive"),
                    ],
                  ),
            ),
            Spacer(),
            GetBuilder<EditItemController>(
              builder:
                  (controller) => ElevatedButton.icon(
                    onPressed: () {
                      controller.variantInputs.add(VariantInput());
                      controller.update();
                    },
                    icon: Icon(Icons.add),
                    label: Text("Add Variant"),
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
