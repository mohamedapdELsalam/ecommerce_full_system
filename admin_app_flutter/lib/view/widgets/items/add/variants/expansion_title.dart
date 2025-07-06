import 'package:adminapp/core/class/variant_input.dart';
import 'package:adminapp/core/functions/hex_to_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpansionTitle extends StatelessWidget {
  final int index;
  const ExpansionTitle({super.key, required this.variant, required this.index});

  final VariantInput variant;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Variant ${index + 1}", style: context.textTheme.bodySmall),
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
            style: context.textTheme.labelMedium!.copyWith(
              color: const Color.fromARGB(255, 188, 143, 9),
            ),
          ),
      ],
    );
  }
}
