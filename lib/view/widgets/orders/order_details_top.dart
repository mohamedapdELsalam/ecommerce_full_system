import 'package:ecommerceapp/core/constants/lang_keys.dart';
import 'package:ecommerceapp/data/model/order_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:jiffy/jiffy.dart';

class OrderDetailsTop extends StatelessWidget {
  const OrderDetailsTop({
    super.key,
    required this.orderModel,
  });

  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "${LangKeys.orderNumber.tr} : ${orderModel.ordersId}",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(Jiffy.parse(orderModel.ordersDateTime!).fromNow()),
        )
      ],
    );
  }
}
