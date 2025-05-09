import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

showAlertDialog({
  String? title,
  String? content,
  required void Function() onConfirm,
  void Function()? onCancel,
}) {
  Get.defaultDialog(
    title: title!,
    content: Text(content!),
    titleStyle: TextStyle(color: Colors.blue),
    cancel: ElevatedButton(onPressed: onCancel, child: Text("cancel")),
    confirm: ElevatedButton(onPressed: onConfirm, child: Text("delete")),
  );
}
