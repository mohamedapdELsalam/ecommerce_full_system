import 'package:ecommerceapp/controller/items/item_details_controller.dart';
import 'package:ecommerceapp/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddToCartButton extends GetView<ItemsDetailsController> {
  final String title;
  final void Function()? onPressed;
  final bool isEnabled;
  const AddToCartButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.isEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            overlayColor: WidgetStatePropertyAll(
                const Color.fromARGB(101, 255, 255, 255)),
            foregroundColor: WidgetStatePropertyAll(Colors.white),
            enableFeedback: false,
            backgroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.disabled)) {
                return const Color.fromARGB(117, 215, 162, 2);
              }
              return const Color.fromARGB(255, 215, 162, 2);
            })),
        onPressed: isEnabled ? onPressed : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.shopping_cart),
            SizedBox(width: 5),
            Text(title,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: context.secondaryColor)),
          ],
        ));
  }
}
