import 'package:ecommerceapp/controller/items/item_details_controller.dart';
import 'package:ecommerceapp/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductSize extends GetView<ItemsDetailsController> {
  final String size;
  final int sizeId;
  final bool isSelected;
  const ProductSize({
    required this.size,
    required this.sizeId,
    required this.isSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Color.fromARGB(0, 0, 0, 0),
      onTap: () {
        controller.selectSize(sizeId);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10, right: 10, top: 10),
        height: 25,
        width: 40,
        decoration: BoxDecoration(
            border: Border.all(
              width: isSelected ? 1.5 : 0.5,
              color: isSelected ? Colors.lightBlueAccent : Colors.blueGrey,
            ),
            boxShadow: isSelected
                ? [
                    BoxShadow(blurRadius: 2),
                  ]
                : [],
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Center(
            child: Text(size,
                style: TextStyle(fontSize: 12, color: context.onPrimaryColor))),
      ),
    );
  }
}
