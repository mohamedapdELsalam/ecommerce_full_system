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
      splashColor: Color.fromRGBO(0, 0, 0, 0),
      onTap: () {
        controller.selectColor(colorId);
      },
      child: Container(
          margin: EdgeInsets.only(right: 10),
          height: 30,
          width: 30,
          decoration: BoxDecoration(
              border: Border.all(
                  width: isSelected ? 1.5 : 0.5,
                  color: isSelected ? Colors.lightBlueAccent : Colors.blueGrey),
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
