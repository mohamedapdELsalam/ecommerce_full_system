import 'package:ecommerceapp/controller/cart_controller.dart';
import 'package:ecommerceapp/data/model/checkout_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 300,
      height: 43,
      color: Colors.yellow,
      onPressed: () {},
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
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: Center(child: Text("${controller.totalCartItems}")))),
        ],
      ),
    );
  }
}
