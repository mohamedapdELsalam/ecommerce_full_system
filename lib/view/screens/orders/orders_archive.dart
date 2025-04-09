import 'package:ecommerceapp/controller/orders_controller.dart';
import 'package:ecommerceapp/core/class/handlind_status_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersArchive extends StatelessWidget {
  const OrdersArchive({super.key});

  @override
  Widget build(BuildContext context) {
    //  OrdersController controller =
    Get.put(OrdersController());
    return Scaffold(
        appBar: AppBar(
          title: Text("Orders Archive"),
          actions: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CircleAvatar(
                  radius: 15,
                  child: GetBuilder<OrdersController>(
                      builder: (controller) =>
                          Text("${controller.archiveOrders.length}")),
                ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder<OrdersController>(
            builder: (controller) => HandlingStatusRequest(
              controller: controller,
                statusRequest: controller.statusRequest,
                widget: ListView.builder(
                  itemCount: controller.archiveOrders.length,
                  itemBuilder: (context, i) {
                    var orderModel = controller.archiveOrders[i];
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "order number : ${orderModel.ordersId}",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            SizedBox(height: 4),
                            Text(
                              "payment method : ${orderModel.ordersPaymentMethod == 0 ? "cash" : "credit card"}",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Text(
                              "delivery type : ${orderModel.ordersDeliveryType == 0 ? "delivery" : "recieve"}",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Text(
                              "delivery price : ${orderModel.ordersDeliveryPrice} \$",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Text(
                              "status : ${controller.printOrderStatus(orderModel.ordersStatus!)}",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            SizedBox(height: 10),
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "total price : ${orderModel.ordersTotalPrice}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
                                ),
                                MaterialButton(
                                  onPressed: () {},
                                  child: Text("details"),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )),
          ),
        ));
  }
}
