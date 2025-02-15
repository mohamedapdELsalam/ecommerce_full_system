import 'package:ecommerceapp/view/widgets/itemDetails/procuct_color_cirlce.dart';
import 'package:ecommerceapp/view/widgets/itemDetails/product_size.dart';
import 'package:flutter/material.dart';

class BottomItemDetails extends StatelessWidget {
  const BottomItemDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(top: 0),
              child: Text("Color",
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary))),
          Container(
            padding: EdgeInsets.only(top: 5),
            child: Row(
              children: [
                ProductColorCircle(color: Colors.red),
                ProductColorCircle(color: Colors.yellow),
                ProductColorCircle(color: Colors.blue),
                ProductColorCircle(color: Colors.grey),
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 0),
              child: Text("Size",
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary))),
          Container(
            padding: EdgeInsets.only(top: 5),
            child: Row(
              children: [
                ProductSize(size: "s"),
                ProductSize(size: "m"),
                ProductSize(size: "l"),
                ProductSize(size: "xl"),
                ProductSize(size: "xxl"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
