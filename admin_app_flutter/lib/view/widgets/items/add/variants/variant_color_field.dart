import 'package:adminapp/controller/items/add_item_controller.dart';
import 'package:adminapp/view/widgets/items/add/variants/color_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VariantColorField extends GetView<AddItemController> {
  const VariantColorField({super.key, required this.variant});

  final VariantInput variant;

  @override
  Widget build(BuildContext context) {
    return ColorPickerField(
      variant: variant,
      selectedHex: variant.colorHex,
      onSelect: (color) {
        variant.colorHex = color;
        int index = controller.colors.indexWhere(
          (e) => e.colorsHexcode == color,
        );
        variant.colorId = controller.colors[index].colorsId;
        variant.colorController.text = controller.colors[index].colorsName!;
        // controller.update();
      },
    );
  }
}
