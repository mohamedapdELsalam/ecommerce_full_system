import 'package:ecommerceapp/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutButton extends GetView<CartController> {
  const CheckoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 300,
      height: 43,
      color: Colors.yellow,
      onPressed: () {
        controller.goToCheckout();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Checkout"),
          SizedBox(
            width: 20,
          ),
          GetBuilder<CartController>(
              builder: (controller) => Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: Center(
                      child: FittedBox(
                          child: Text("${controller.totalCartItems}"))))),
        ],
      ),
    );
  }
}
