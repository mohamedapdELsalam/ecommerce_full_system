import 'package:adminapp/core/functions/hex_to_color.dart';
import 'package:adminapp/core/shared/global_textform.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:adminapp/controller/items/add_item_controller.dart';

class ColorPickerField extends StatelessWidget {
  final String? selectedHex;
  final Function(String hex) onSelect;
  final VariantInput variant;

  const ColorPickerField({
    super.key,
    required this.selectedHex,
    required this.onSelect,
    required this.variant,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddItemController>(
      builder: (controller) {
        int? index = controller.colors.indexWhere(
          (e) => e.colorsHexcode == selectedHex,
        );
        if (index == -1) {
          index = null;
        }
        print("----------------------------");
        print(index);
        print("----------------------------");

        return GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder:
                  (_) => AlertDialog(
                    title: const Text(
                      "choose color",
                      textAlign: TextAlign.center,
                    ),
                    content: SingleChildScrollView(
                      child: Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children:
                            controller.colors.map((color) {
                              final isSelected =
                                  selectedHex == color.colorsHexcode;
                              return GestureDetector(
                                onTap: () {
                                  onSelect(color.colorsHexcode!);
                                  Navigator.pop(context);
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: 35,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: hexToColor(color.colorsHexcode!),
                                        border:
                                            isSelected
                                                ? Border.all(
                                                  color: Colors.black,
                                                  width: 2,
                                                )
                                                : null,
                                      ),
                                      child:
                                          isSelected
                                              ? const Icon(
                                                Icons.check,
                                                color: Colors.white,
                                                size: 20,
                                              )
                                              : null,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      color.colorsName!,
                                      style: const TextStyle(fontSize: 10),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                      ),
                    ),
                  ),
            );
          },
          child: GlobalTextForm(
            enabled: false,
            suffixIcon: Icon(Icons.arrow_drop_down),
            hint: "choose color",
            prefix: "color",
            controller: variant.colorController,
            validator: (v) {},
          ),
        );
      },
    );
  }
}
