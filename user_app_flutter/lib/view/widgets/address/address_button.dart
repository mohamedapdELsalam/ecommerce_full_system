import 'package:flutter/material.dart';

class AddressButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const AddressButton({
    super.key,
    required this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextButton(
        style:
            ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.white)),
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}
