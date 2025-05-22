import 'package:ecommerceapp/controller/orders/orders_controller.dart';
import 'package:ecommerceapp/core/constants/app_routes.dart';
import 'package:ecommerceapp/core/constants/lang_keys.dart';
import 'package:ecommerceapp/data/model/order_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderButtons extends GetView<OrdersController> {
  const OrderButtons({
    super.key,
    required this.orderModel,
  });

  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MaterialButton(
          color: Colors.yellow,
          onPressed: () {
            Get.toNamed(AppRoutes.ordersDetails,
                arguments: {"orderModel": orderModel});
          },
          child: Text(LangKeys.details.tr),
        ),
        SizedBox(width: 20),
        if (orderModel.ordersStatus == 0)
          MaterialButton(
            color: Colors.black,
            onPressed: () {
              controller.deleteOrder(
                  orderId: orderModel.ordersId!,
                  orderStatus: orderModel.ordersStatus!);
            },
            child: Text(LangKeys.delete.tr),
          ),
        if (orderModel.ordersStatus == 3)
          MaterialButton(
              color: Colors.black,
              onPressed: () {
                Get.toNamed(AppRoutes.orderTracking,
                    arguments: {"orderModel": orderModel});
              },
              child: Text(LangKeys.tracking.tr)),
      ],
    );
  }
}
