import 'package:ecommerceapp/controller/place_order_controller.dart';
import 'package:ecommerceapp/core/constants/lang_keys.dart';
import 'package:ecommerceapp/view/widgets/place_order/checkout_choice_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecieveStoreChoice extends GetView<PlaceOrderController> {
  const RecieveStoreChoice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CheckoutChoiceCard(
      title: Text(LangKeys.receiveStore.tr),
      active: controller.deliveryMethod == 1,
      onPressed: () {
        controller.changeDeliveryMethod(1);
      },
    );
  }
}
