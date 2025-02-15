import 'package:flutter/material.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.yellow,
      onPressed: () {},
      child: Text("CheckPoint"),
    );
  }
}
