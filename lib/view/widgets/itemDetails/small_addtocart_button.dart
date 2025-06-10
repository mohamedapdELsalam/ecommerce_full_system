import 'package:flutter/material.dart';

class SmallAddToCartButton extends StatelessWidget {
  final String title;
  const SmallAddToCartButton({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
                Theme.of(context).colorScheme.secondary)),
        onPressed: () {},
        child: Text(title,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: Theme.of(context).colorScheme.primary)));
  }
}
