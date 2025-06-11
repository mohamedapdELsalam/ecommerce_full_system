import 'package:adminapp/controller/orders_controller.dart';
import 'package:flutter/material.dart';

class OrdersFloatingActionButton extends StatelessWidget {
  final OrdersController controller;
  final ColorScheme mycolors;
  const OrdersFloatingActionButton({
    super.key,
    required this.controller,
    required this.mycolors,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor:
          controller.currentIndex == 0 ? mycolors.primary : mycolors.onPrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      child: Icon(
        Icons.home,
        color:
            controller.currentIndex == 0
                ? mycolors.onPrimary
                : mycolors.onSecondary,
      ),
      onPressed: () {
        controller.changePage(0);
      },
    );
  }
}
