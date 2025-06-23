import 'package:ecommerceapp/controller/place_order_controller.dart';
import 'package:ecommerceapp/core/constants/lang_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectedPaymentMethod extends GetView<PlaceOrderController> {
  const SelectedPaymentMethod({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          LangKeys.paymentMethod.tr,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        if (controller.paymentMethod != null)
          Text(
              "   (${controller.paymentMethod == 0 ? "cash" : controller.paymentMethod == 1 ? "credit card" : ""})")
      ],
    );
  }
}
