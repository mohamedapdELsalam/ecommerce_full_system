import 'package:adminapp/controller/orders_controller.dart';
import 'package:adminapp/core/constants/lang_keys.dart';
import 'package:adminapp/data/model/order_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetails extends GetView<OrdersController> {
  const OrderDetails({
    super.key,
    required this.orderModel,
  });

  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${LangKeys.paymentMethod.tr} : ${orderModel.ordersPaymentMethod == 0 ? LangKeys.cash.tr : LangKeys.creditCards.tr}",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            "${LangKeys.delivery.tr} : ${orderModel.ordersDeliveryType == 0 ? LangKeys.delivery.tr : LangKeys.receiveStore.tr}",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            "${LangKeys.deliveryCost.tr} : ${orderModel.ordersDeliveryPrice} \$",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            "${LangKeys.status.tr} : ${controller.printOrderStatus(orderModel.ordersStatus!)}",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Divider(),
          Text(
            "${LangKeys.totalPrice.tr} : ${orderModel.ordersTotalPrice}",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary),
          ),
        ],
      ),
    );
  }
}
