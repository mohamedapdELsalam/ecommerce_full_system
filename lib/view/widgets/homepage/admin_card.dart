import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';

class AdminCard extends StatelessWidget {
  final String title;
  final Widget image;
  final void Function() onTap;
  const AdminCard({
    super.key,
    required this.title,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        Get.defaultDialog(
          title: "be care",
          middleText: "what you need ? ",
          textConfirm: "Edit",
          textCancel: "delete",
        );
      },
      onTap: onTap,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [image, Text(title)],
        ),
      ),
    );
  }
}
