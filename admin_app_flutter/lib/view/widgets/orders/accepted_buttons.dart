import 'package:adminapp/controller/orders/accepted_controller.dart';
import 'package:adminapp/core/constants/app_routes.dart';
import 'package:adminapp/core/constants/lang_keys.dart';
import 'package:adminapp/data/model/order_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AcceptedOrderButtons extends StatelessWidget {
  const AcceptedOrderButtons({super.key, required this.orderModel});

  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    AcceptedOrdersController acceptedController = Get.find();
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MaterialButton(
          color: Colors.yellow,
          onPressed: () {
            Get.toNamed(
              AppRoutes.ordersDetails,
              arguments: {"orderModel": orderModel},
            );
          },
          child: Text(LangKeys.details.tr),
        ),
        SizedBox(width: 20),
        if (orderModel.ordersStatus == 1)
          MaterialButton(
            color: Colors.black,
            onPressed: () {
              acceptedController.prepareOrder(
                adminId: 1,
                orderId: orderModel.ordersId,
                userId: orderModel.ordersUserid,
                deliveryType: orderModel.ordersDeliveryType,
              );
            },
            child: Text(LangKeys.prepare.tr),
          ),

        if (orderModel.ordersStatus == 3)
          MaterialButton(
            color: Colors.black,
            onPressed: () {
              // Get.toNamed(AppRoutes.orderTracking,
              //     arguments: {"orderModel": orderModel});
            },
            child: Text(LangKeys.tracking.tr),
          ),
      ],
    );
  }
}
