import 'package:flutter/material.dart';

class settingOptionModel {
  final String title;
  final String suptitle;
  final Widget? trailing;
  final void Function() ontap;
  settingOptionModel(
      {required this.title,
      required this.suptitle,
      this.trailing,
      required this.ontap});
}
