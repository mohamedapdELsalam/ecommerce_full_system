import 'package:ecommerceapp/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartCounterAndTotal extends GetView<CartController> {
  final int i;
  const CartCounterAndTotal({
    required this.i,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
        color: const Color.fromARGB(234, 0, 0, 0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            highlightColor: const Color.fromARGB(55, 76, 175, 79),
            icon: Icon(
              Icons.add,
              size: 15,
            ),
            onPressed: () {
              controller.addCart(controller.cartItems[i].itemsId!, i);
            },
          ),
          Obx(
            () => Text(
              "${controller.cartCount[i]}",
              style: TextStyle(fontSize: 10),
            ),
          ),
          IconButton(
            highlightColor: const Color.fromARGB(55, 175, 76, 76),
            icon: Icon(
              Icons.remove,
              size: 15,
            ),
            onPressed: () {
              controller.removeCart(controller.cartItems[i].itemsId!, i);
            },
          ),
        ],
      ),
    );
  }
}
