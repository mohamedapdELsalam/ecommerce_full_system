import 'package:adminapp/controller/items/edit_item_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditDeleteVariantButton extends GetView<EditItemController> {
  final int index;
  const EditDeleteVariantButton({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton.icon(
        onPressed: () {
          controller.variantInputs.removeAt(index);
          controller.update();
        },
        icon: Icon(Icons.delete),
        label: Text("delete", style: TextStyle(color: Colors.white)),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          iconColor: Colors.white,
        ),
      ),
    );
  }
}
