import 'package:adminapp/controller/orders_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderCounter extends StatelessWidget {
  final bool pending;
  const OrderCounter({required this.pending, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CircleAvatar(
        radius: 15,
        child: GetBuilder<OrdersController>(
          builder:
              (controller) => Text(
                pending
                    ? "${controller.pendingOrders.length}"
                    : "${controller.acceptedOrders.length}",
              ),
        ),
      ),
    );
  }
}
