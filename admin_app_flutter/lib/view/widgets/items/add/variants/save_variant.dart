import 'package:adminapp/controller/items/add_item_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SaveVariantButton extends GetView<AddItemController> {
  final int index;
  const SaveVariantButton({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: ElevatedButton.icon(
        onPressed: () {
          controller.update();
        },
        icon: Icon(Icons.save),
        label: Text("save", style: TextStyle(color: Colors.white)),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.lightGreen,
          iconColor: Colors.white,
        ),
      ),
    );
  }
}
