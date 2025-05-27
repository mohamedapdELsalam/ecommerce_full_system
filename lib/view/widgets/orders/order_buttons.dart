import 'package:adminapp/controller/orders/pending_controller.dart';
import 'package:adminapp/core/constants/app_routes.dart';
import 'package:adminapp/core/constants/lang_keys.dart';
import 'package:adminapp/data/model/order_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PendingOrderButtons extends StatelessWidget {
  const PendingOrderButtons({super.key, required this.orderModel});

  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    PendingOrdersController pendingController = Get.find();
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
        if (orderModel.ordersStatus == 0)
          MaterialButton(
            color: Colors.black,
            onPressed: () {
              pendingController.approveOrder(
                userId: orderModel.ordersUserid,
                orderId: orderModel.ordersId!,
                adminId: 1,
              );
            },
            child: Text(LangKeys.accept.tr),
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
