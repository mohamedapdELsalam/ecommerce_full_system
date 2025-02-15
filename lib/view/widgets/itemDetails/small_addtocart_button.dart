import 'package:flutter/material.dart';

class smallAddToCartButton extends StatelessWidget {
  const smallAddToCartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
                Theme.of(context).colorScheme.secondary)),
        onPressed: () {},
        child: Text("Add To Cart",
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: Theme.of(context).colorScheme.primary)));
  }
}
