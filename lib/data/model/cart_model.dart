import 'package:flutter/material.dart';

class CartModel {
  final String title;
  final String price;
  final Widget? leading;
  CartModel({
    required this.title,
    required this.price,
    this.leading,
  });
}
