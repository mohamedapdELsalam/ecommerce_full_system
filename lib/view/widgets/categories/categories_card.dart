import 'package:adminapp/core/shared/alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';

class CategoriesCard extends StatelessWidget {
  final String title;
  final Widget image;
  final void Function() onTap;
  final void Function()? onCancel;
  final void Function() onDelete;
  const CategoriesCard({
    super.key,
    required this.title,
    required this.image,
    required this.onTap,
    this.onCancel,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        showAlertDialog(
          title: "warning",
          content: "do you want to delete this category",
          onCancel: () {
            Get.back();
          },
          onConfirm: () {
            showAlertDialog(
              onConfirm: () {
                Get.back();
                Get.back();
                onDelete();
              },
              onCancel: () {
                Get.back();
              },
              title: "warning",
              content: "do you agreed ?!!",
            );
          },
        );
        // Get.dialog(
        //   AlertDialog(
        //     title: Text("be care", textAlign: TextAlign.center),

        //     content: Text(
        //       "what you need ? ",
        //       style: TextTheme.of(context).titleMedium,
        //       textAlign: TextAlign.center,
        //     ),
        //     actions: [
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //         children: [
        //           ElevatedButton(
        //             onPressed: () {
        //               Get.back();
        //               onCancel;
        //             },
        //             child: Text(
        //               'Edit',
        //               style: TextTheme.of(context).bodyMedium,
        //             ),
        //           ),
        //           ElevatedButton(
        //             onPressed: () {
        //               if (Get.isSnackbarOpen) {
        //                 Get.close(1);
        //               }
        //               Get.back();
        //               onDelete();
        //             },
        //             child: Text(
        //               'Delete',
        //               style: TextTheme.of(context).bodyMedium,
        //             ),
        //           ),
        //         ],
        //       ),
        //     ],
        //   ),
        // );
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
