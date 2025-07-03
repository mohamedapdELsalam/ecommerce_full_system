import 'package:adminapp/controller/items/add_item_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeleteVariantButton extends GetView<AddItemController> {
  final int index;
  const DeleteVariantButton({super.key, required this.index});

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
