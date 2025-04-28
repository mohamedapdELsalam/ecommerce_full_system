import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';

class CategoriesCard extends StatelessWidget {
  final String title;
  final Widget image;
  final void Function() onTap;
  final void Function() onEdit;
  final void Function() onDelete;
  const CategoriesCard({
    super.key,
    required this.title,
    required this.image,
    required this.onTap,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        Get.dialog(
          AlertDialog(
            title: Text("be care", textAlign: TextAlign.center),

            content: Text(
              "what you need ? ",
              style: TextTheme.of(context).titleMedium,
              textAlign: TextAlign.center,
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.back();
                      onEdit();
                    },
                    child: Text(
                      'Edit',
                      style: TextTheme.of(context).bodyMedium,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (Get.isSnackbarOpen) {
                        Get.close(1);
                      }
                      Get.back();
                      onDelete();
                    },
                    child: Text(
                      'Delete',
                      style: TextTheme.of(context).bodyMedium,
                    ),
                  ),
                ],
              ),
            ],
          ),
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
