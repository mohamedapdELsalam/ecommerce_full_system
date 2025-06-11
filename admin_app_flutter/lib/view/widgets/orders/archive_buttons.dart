import 'package:adminapp/core/constants/app_routes.dart';
import 'package:adminapp/data/model/order_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArchiveButtons extends StatelessWidget {
  const ArchiveButtons({super.key, required this.orderModel});

  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(flex: 5),
        MaterialButton(
          color: Colors.yellow,
          onPressed: () {
            Get.toNamed(
              AppRoutes.ordersDetails,
              arguments: {"orderModel": orderModel},
            );
          },
          child: Text("details"),
        ),
        Spacer(flex: 1),
        if (orderModel.ordersRating == 0)
          MaterialButton(
            color: Colors.black,
            onPressed: () {
              // showDialogRating(
              //   context,
              //   orderModel.ordersId!,
              // );
            },
            child: Text("rating"),
          ),
      ],
    );
  }
}
