import 'package:ecommerceapp/controller/cart_controller.dart';
import 'package:ecommerceapp/core/constants/apiLink.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartItemImage extends GetView<CartController> {
  final int i;
  const CartItemImage({
    required this.i,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(topRight: Radius.circular(20)),
      child: Image.network(
        "${ApiLinks.itemImageRoot}/${controller.cartItems[i].itemsImage}",
        fit: BoxFit.cover,
        height: 80,
        width: 119,
      ),
    );
  }
}
