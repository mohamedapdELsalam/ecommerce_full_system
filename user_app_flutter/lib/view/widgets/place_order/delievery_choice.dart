import 'package:ecommerceapp/controller/place_order_controller.dart';
import 'package:ecommerceapp/core/constants/lang_keys.dart';
import 'package:ecommerceapp/core/extensions/context_extensions.dart';
import 'package:ecommerceapp/view/widgets/place_order/checkout_choice_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryChoice extends GetView<PlaceOrderController> {
  const DeliveryChoice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CheckoutChoiceCard(
      title: Row(
        children: [
          Text(LangKeys.delivery.tr),
          SizedBox(width: 10),
          Text(
            "+ ${controller.deliveryPrice} \$",
            style: TextStyle(color: context.primaryColor),
          ),
        ],
      ),
      active: controller.deliveryMethod == 0,
      onPressed: () {
        controller.changeDeliveryMethod(0);
      },
    );
  }
}
