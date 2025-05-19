import 'package:ecommerceapp/controller/orders/orders_controller.dart';
import 'package:ecommerceapp/core/class/handlind_status_request.dart';
import 'package:ecommerceapp/core/constants/app_routes.dart';
import 'package:ecommerceapp/core/constants/lang_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // OrdersController controller =
    Get.put(OrdersController());
    return Scaffold(
        appBar: AppBar(
          title: Text(LangKeys.pendingOrders.tr),
          actions: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CircleAvatar(
                  radius: 15,
                  child: GetBuilder<OrdersController>(
                      builder: (controller) =>
                          Text("${controller.pendingOrders.length}")),
                ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              GetBuilder<OrdersController>(
                builder: (controller) => HandlingStatusRequest(
                    controller: controller,
                    statusRequest: controller.statusRequest,
                    widget: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.pendingOrders.length,
                      itemBuilder: (context, i) {
                        var orderModel = controller.pendingOrders[i];
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "${LangKeys.orderNumber.tr} : ${orderModel.ordersId}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(Jiffy.parse(
                                              orderModel.ordersDateTime!)
                                          .fromNow()),
                                    )
                                  ],
                                ),
                                SizedBox(height: 4),
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
                                SizedBox(height: 10),
                                Divider(),
                                Row(
                                  children: [
                                    Text(
                                      "${LangKeys.totalPrice.tr} : ${orderModel.ordersTotalPrice}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary),
                                    ),
                                    Spacer(flex: 5),
                                    MaterialButton(
                                      color: Colors.yellow,
                                      onPressed: () {
                                        Get.toNamed(AppRoutes.ordersDetails,
                                            arguments: {
                                              "orderModel": orderModel
                                            });
                                      },
                                      child: Text(LangKeys.details.tr),
                                    ),
                                    Spacer(flex: 1),
                                    if (orderModel.ordersStatus == 0)
                                      MaterialButton(
                                        color: Colors.black,
                                        onPressed: () {
                                          controller.deleteOrder(
                                              orderId: orderModel.ordersId!,
                                              orderStatus:
                                                  orderModel.ordersStatus!);
                                        },
                                        child: Text(LangKeys.delete.tr),
                                      ),
                                    if (orderModel.ordersStatus == 3)
                                      MaterialButton(
                                          color: Colors.black,
                                          onPressed: () {
                                            Get.toNamed(AppRoutes.orderTracking,
                                                arguments: {
                                                  "orderModel": orderModel
                                                });
                                          },
                                          child: Text(LangKeys.tracking.tr)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )),
              ),
              TextButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.archiveOrders);
                  },
                  child: Text(LangKeys.archiveOrders.tr)),
            ],
          ),
        ));
  }
}
