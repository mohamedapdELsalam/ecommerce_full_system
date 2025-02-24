import 'package:ecommerceapp/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartTitleAndPrice extends GetView<CartController> {
  final int index;
  const CartTitleAndPrice({
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${controller.cartItems[index].itemsNameEn}",
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: Theme.of(context).colorScheme.onSecondary),
          ),
          Text("${controller.cartItems[index].itemsPrice}\$",
              style: Theme.of(context).textTheme.titleSmall!),
        ],
      ),
    );
  }
}
