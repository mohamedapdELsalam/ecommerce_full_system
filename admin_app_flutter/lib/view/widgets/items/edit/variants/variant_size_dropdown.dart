import 'package:adminapp/controller/items/edit_item_controller.dart';
import 'package:adminapp/core/class/variant_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditVariantSizeDropdown extends GetView<EditItemController> {
  const EditVariantSizeDropdown({super.key, required this.variant});

  final VariantInput variant;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      validator: (value) {
        if (value == null) {
          return "choose size";
        }
        return null;
      },
      onTap: () {},
      onSaved: (val) {
        variant.sizeId = val;
        int index = controller.sizes.indexWhere((e) => e["sizes_id"] == val);
        variant.sizedController.text = controller.sizes[index]["sizes_label"];
      },
      hint: Text(
        variant.sizedController.text.isEmpty
            ? "choose size"
            : variant.sizedController.text,
        style: TextStyle(
          color: ColorScheme.of(context).onSecondary.withAlpha(140),
          fontSize: 13,
          fontWeight: FontWeight.normal,
        ),
      ),
      padding: EdgeInsets.all(0),
      decoration: InputDecoration(
        label: Text(
          'size',
          style: TextStyle(
            color: ColorScheme.of(context).onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        fillColor: ColorScheme.of(context).onPrimary.withAlpha(160),

        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            strokeAlign: 1,
            width: 1,
            color: const Color.fromARGB(87, 63, 62, 62),
          ),
        ),
      ),
      items: [
        ...List.generate(controller.sizes.length, (i) {
          int sizeId = controller.sizes[i]["sizes_id"];
          return DropdownMenuItem(
            value: sizeId,

            child: Text(
              "${controller.sizes[i]["sizes_label"]}",
              style: TextTheme.of(context).bodyMedium!.copyWith(
                color: ColorScheme.of(context).onSecondary,
              ),
            ),
          );
        }),
      ],
      onChanged: (val) {
        variant.sizeId = val;
        int index = controller.sizes.indexWhere((e) => e["sizes_id"] == val);
        variant.sizedController.text = controller.sizes[index]["sizes_label"];
      },
    );
  }
}
