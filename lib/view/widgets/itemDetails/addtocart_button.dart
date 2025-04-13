import 'package:ecommerceapp/controller/item_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddToCartButton extends GetView<ItemsDetailsController> {
  final int itemId;
  const AddToCartButton({
    required this.itemId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Theme.of(context).cardColor),
        ),
        onPressed: () {
          controller.addToCart();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 13),
          child: Text(
            "Add To Cart",
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
        ));
  }
}
