import 'package:ecommerceapp/data/model/checkout_model.dart';
import 'package:flutter/material.dart';

class CartCheckout extends StatelessWidget {
  const CartCheckout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          ...List.generate(checkPointsList.length + 1, (index) {
            if (checkPointsList.length - 1 == index) {
              return Divider();
            }
            int i = index == checkPointsList.length ? index - 1 : index;
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                checkPointsList[i].title,
                checkPointsList[i].price,
              ],
            );
          })
        ],
      ),
    );
  }
}
