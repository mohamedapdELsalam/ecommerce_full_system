import 'package:adminapp/controller/items/add_item_controller.dart';
import 'package:adminapp/core/shared/global_textform.dart';
import 'package:adminapp/view/widgets/items/add/variants/delete_variant_button.dart';
import 'package:adminapp/view/widgets/items/add/variants/expansion_title.dart';
import 'package:adminapp/view/widgets/items/add/variants/save_variant.dart';
import 'package:adminapp/view/widgets/items/add/variants/variant_color_field.dart';
import 'package:adminapp/view/widgets/items/add/variants/variant_size_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VariantExpansionTile extends GetView<AddItemController> {
  const VariantExpansionTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddItemController>(
      builder:
          (_) => Column(
            children: List.generate(controller.variantInputs.length, (index) {
              final variant = controller.variantInputs[index];
              return ExpansionTile(
                key: UniqueKey(),
                title: ExpansionTitle(variant: variant, index: index),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: Transform.scale(
                      scale: 0.9,
                      child: Column(
                        children: [
                          VariantColorField(variant: variant),
                          SizedBox(height: 10),
                          VariantSizeDropdown(variant: variant),
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
                              DeleteVariantButton(index: index),
                              SaveVariantButton(index: index),
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
