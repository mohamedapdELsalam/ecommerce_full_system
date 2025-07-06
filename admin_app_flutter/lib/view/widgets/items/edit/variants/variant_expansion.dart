import 'package:adminapp/controller/items/edit_item_controller.dart';
import 'package:adminapp/core/functions/hex_to_color.dart';
import 'package:adminapp/core/shared/global_textform.dart';
import 'package:adminapp/view/widgets/items/edit/variants/delete_variant_button.dart';
import 'package:adminapp/view/widgets/items/edit/variants/save_variant.dart';
import 'package:adminapp/view/widgets/items/edit/variants/variant_color_field.dart';
import 'package:adminapp/view/widgets/items/edit/variants/variant_size_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VariantExpansionTileEdit extends GetView<EditItemController> {
  const VariantExpansionTileEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditItemController>(
      builder:
          (_) => Column(
            children: List.generate(controller.variantInputs.length, (index) {
              final variant = controller.variantInputs[index];
              return ExpansionTile(
                key: UniqueKey(),
                title: Row(
                  children: [
                    Text(
                      "Variant ${index + 1}",
                      style: context.textTheme.bodySmall,
                    ),
                    SizedBox(width: 20),
                    if (variant.colorHex != null)
                      CircleAvatar(
                        radius: 12,
                        backgroundColor: hexToColor(variant.colorHex!),
                      ),
                    SizedBox(width: 8),
                    if (variant.sizeId != null)
                      CircleAvatar(
                        radius: 12,
                        child: Text(
                          variant.sizedController.text,
                          style: context.textTheme.labelSmall,
                        ),
                      ),
                    SizedBox(width: 8),
                    if (variant.priceController.text.isNotEmpty)
                      Text(
                        "${variant.priceController.text} \$",
                        style: context.textTheme.titleSmall!.copyWith(
                          color: const Color.fromARGB(255, 188, 143, 9),
                        ),
                      ),
                  ],
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: Transform.scale(
                      scale: 0.9,
                      child: Column(
                        children: [
                          EditVariantColorField(variant: variant),
                          SizedBox(height: 10),
                          EditVariantSizeDropdown(variant: variant),
                          SizedBox(height: 10),
                          GlobalTextForm(
                            hint: "enter price",
                            prefix: "price",
                            controller: variant.priceController,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "enter price";
                              }
                              return null;
                            },
                            isNumber: true,
                          ),
                          SizedBox(height: 10),
                          GlobalTextForm(
                            hint: "enter quantity",
                            prefix: "quantity",
                            controller: variant.countController,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "enter quantity";
                              }
                              return null;
                            },
                            isNumber: true,
                          ),
                          SizedBox(height: 10),
                          GlobalTextForm(
                            hint: "enter discount",
                            prefix: "discount %",
                            controller: variant.discountCtrl,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "enter discount";
                              }
                              return null;
                            },
                            isNumber: true,
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              EditDeleteVariantButton(index: index),
                              EditSaveVariantButton(index: index),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
    );
  }
}
