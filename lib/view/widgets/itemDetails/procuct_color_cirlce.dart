import 'package:flutter/material.dart';

class ProductColorCircle extends StatelessWidget {
  final Color color;
  const ProductColorCircle({
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(bottom: 10, right: 10),
        height: 30,
        width: 30,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(blurRadius: 1),
        ], color: color, borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );
  }
}
