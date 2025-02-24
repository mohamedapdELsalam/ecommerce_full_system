import 'package:ecommerceapp/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddToCartButton extends StatelessWidget {
  final int itemId;
  const AddToCartButton({
    required this.itemId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    CartController controller = Get.put(CartController());
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Theme.of(context).cardColor),
        ),
        onPressed: () {
          controller.addCart(itemId, 1);
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
