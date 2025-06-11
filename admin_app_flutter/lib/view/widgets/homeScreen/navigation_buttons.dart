import 'package:adminapp/controller/homescreen_controller.dart';
import 'package:adminapp/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeBottomAppbarButton extends GetView<HomeScreenController> {
  final void Function()? onPressed;
  final String title;
  final IconData icon;
  final bool isActive;
  const HomeBottomAppbarButton({
    required this.onPressed,
    required this.icon,
    required this.title,
    required this.isActive,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onPressed,
        child: Column(
          children: [
            Icon(
              icon,
              color: !isActive ? context.onSecondary : context.primaryColor,
            ),
            Text(
              title,
              style: TextStyle(
                color: !isActive ? context.onSecondary : context.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
