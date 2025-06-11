import 'package:ecommerceapp/controller/items/item_details_controller.dart';
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.shopify_outlined, color: Colors.white),
              SizedBox(width: 5),
              Text(
                "Buy Now",
                style:
                    TextStyle(color: Theme.of(context).colorScheme.secondary),
              ),
            ],
          ),
        ));
  }
}
