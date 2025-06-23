import 'package:ecommerceapp/controller/place_order_controller.dart';
import 'package:ecommerceapp/core/constants/lang_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectedShippingAddress extends GetView<PlaceOrderController> {
  const SelectedShippingAddress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          LangKeys.address.tr,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        controller.deliveryMethod == 1
            ? Text(" (${LangKeys.receiveStore.tr})")
            : controller.shippingAddress != null
                ? Text("   (${controller.shippingAddress ?? ""})")
                : Text("")
      ],
    );
  }
}
