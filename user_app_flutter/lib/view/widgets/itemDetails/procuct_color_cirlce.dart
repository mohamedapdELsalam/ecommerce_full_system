import 'package:ecommerceapp/controller/items/item_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductColorCircle extends GetView<ItemsDetailsController> {
  final Color color;
  final int colorId;
  final bool isSelected;
  const ProductColorCircle({
    required this.color,
    required this.isSelected,
    required this.colorId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.selectColor(colorId);
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 10, right: 10),
          height: 30,
          width: 30,
          decoration: BoxDecoration(
              boxShadow: isSelected
                  ? [
                      BoxShadow(blurRadius: 2),
                    ]
                  : [],
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(50))),
          child: isSelected
              ? Center(
                  child: Icon(Icons.done, size: 18),
                )
              : null),
    );
  }
}
