import 'package:ecommerceapp/controller/place_order_controller.dart';
import 'package:ecommerceapp/core/constants/lang_keys.dart';
import 'package:ecommerceapp/view/widgets/place_order/checkout_choice_card.dart';
import 'package:ecommerceapp/view/widgets/place_order/payment_online_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PayOnlineChoice extends GetView<PlaceOrderController> {
  const PayOnlineChoice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CheckoutChoiceCard(
      title: Text(
        LangKeys.payOnline.tr,
        textAlign: TextAlign.start,
      ),
      active: controller.paymentMethod == 1,
      onPressed: () {
        controller.changePaymentMethod(1);
      },
      trailing: paymentsOnlineIcons(),
    );
  }
}
