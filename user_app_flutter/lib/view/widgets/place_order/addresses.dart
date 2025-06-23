import 'package:ecommerceapp/controller/place_order_controller.dart';
import 'package:ecommerceapp/core/constants/app_routes.dart';
import 'package:ecommerceapp/view/widgets/place_order/checkout_choice_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Addresses extends GetView<PlaceOrderController> {
  const Addresses({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(
            controller.addressesList.length,
            (index) => CheckoutChoiceCard(
                title: Text(controller.addressesList[index].name!),
                subtitle: Text(
                    "${controller.addressesList[index].cityAr!} / ${controller.addressesList[index].street!}"),
                onPressed: () {
                  controller.changeShippingAddress(
                      controller.addressesList[index].name!);
                  controller.addressId =
                      controller.addressesList[index].addressId;
                },
                active: controller.shippingAddress ==
                    controller.addressesList[index].name)),
        if (controller.addressesList.isEmpty)
          Card(
            child: Center(
              child: InkWell(
                onTap: () {
                  Get.toNamed(AppRoutes.addAddressLocation);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('اضف عنوان جديد'),
                    Icon(Icons.add),
                  ],
                ),
              ),
            ),
          )
      ],
    );
  }
}
