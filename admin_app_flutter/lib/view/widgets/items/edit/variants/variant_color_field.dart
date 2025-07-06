import 'package:adminapp/controller/items/edit_item_controller.dart';
import 'package:adminapp/core/class/variant_input.dart';
import 'package:adminapp/view/widgets/items/edit/variants/color_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditVariantColorField extends GetView<EditItemController> {
  const EditVariantColorField({super.key, required this.variant});

  final VariantInput variant;

  @override
  Widget build(BuildContext context) {
    return EditColorPickerField(
      variant: variant,
      selectedHex: variant.colorHex,
      onSelect: (color) {
        variant.colorHex = color;
        int index = controller.colors.indexWhere(
          (e) => e.colorsHexcode == color,
        );
        variant.colorId = controller.colors[index].colorsId;
        variant.colorController.text = controller.colors[index].colorsName!;
      },
    );
  }
}
