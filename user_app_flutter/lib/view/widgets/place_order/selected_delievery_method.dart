import 'package:ecommerceapp/controller/place_order_controller.dart';
import 'package:ecommerceapp/core/constants/lang_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectedDeliveryMethod extends GetView<PlaceOrderController> {
  const SelectedDeliveryMethod({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          LangKeys.deliveryMethod.tr,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        if (controller.deliveryMethod != null)
          Text(
              "  (${controller.deliveryMethod == 0 ? LangKeys.delivery.tr : controller.deliveryMethod == 1 ? LangKeys.receiveStore.tr : ""})")
      ],
    );
  }
}
