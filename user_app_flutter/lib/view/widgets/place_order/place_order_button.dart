import 'package:ecommerceapp/controller/place_order_controller.dart';
import 'package:ecommerceapp/core/constants/lang_keys.dart';
import 'package:ecommerceapp/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlaceOrderButton extends GetView<PlaceOrderController> {
  const PlaceOrderButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: MaterialButton(
          minWidth: 300,
          height: 43,
          color: controller.paymentMethod == null ||
                  controller.shippingAddress == null ||
                  controller.deliveryMethod == null
              ? Colors.grey
              : Colors.yellow,
          onPressed: () {
            print("${controller.paymentMethod}");
            if (controller.paymentMethod == 1) {
              controller.pay(context);
            } else {
              controller.checkout();
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${controller.calculateOrderTotal()} \$ ",
                style: TextStyle(color: context.primaryColor),
              ),
              SizedBox(width: 7),
              Text(controller.paymentMethod == 1
                  ? "تابع الدفع"
                  : LangKeys.placeOrder.tr),
            ],
          )),
    );
  }
}
