import 'package:ecommerceapp/controller/items/item_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemDetailsCounter extends GetView<ItemsDetailsController> {
  const ItemDetailsCounter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 38,
        width: 125,
        decoration: BoxDecoration(
            color: const Color.fromARGB(106, 179, 177, 167),
            borderRadius: BorderRadius.circular(30)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              highlightColor: const Color.fromARGB(35, 50, 174, 55),
              icon: Icon(Icons.add),
              onPressed: () {
                controller.addItem();
              },
            ),
            GetBuilder<ItemsDetailsController>(
                builder: (controller) => Text(controller.count.toString())),
            IconButton(
              highlightColor: const Color.fromARGB(33, 244, 67, 54),
              icon: Icon(Icons.remove),
              onPressed: () {
                controller.removeItem();
              },
            ),
          ],
        ));
  }
}
