import 'package:flutter/material.dart';

class CheckPointModel {
  final Widget title;
  final Widget price;
  CheckPointModel({required this.title, required this.price});
}

TextStyle titleStyle = TextStyle();
TextStyle totalStyle =
    TextStyle(color: const Color.fromARGB(255, 200, 183, 30), fontSize: 20);
List<CheckPointModel> checkPointsList = [
  CheckPointModel(
      title: Text("cart total : ", style: titleStyle), price: Text("400 \$")),
  CheckPointModel(
      title: Text("delivery : ", style: titleStyle), price: Text("20 \$")),
  CheckPointModel(
      title: Text("tax : ", style: titleStyle), price: Text("20 \$")),
  CheckPointModel(
      title: Text("total", style: totalStyle),
      price: Text("423 \$", style: totalStyle)),
];
