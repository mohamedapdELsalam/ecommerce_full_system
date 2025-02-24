import 'package:ecommerceapp/controller/cart_controller.dart';
import 'package:ecommerceapp/data/model/checkout_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartCheckout extends GetView<CartController> {
  const CartCheckout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Checkout(),
    );
  }
}
