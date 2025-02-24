import 'package:flutter/material.dart';

class CartCardModel {
  final String title;
  final String price;
  final Widget? leading;
  CartCardModel({
    required this.title,
    required this.price,
    this.leading,
  });
}
