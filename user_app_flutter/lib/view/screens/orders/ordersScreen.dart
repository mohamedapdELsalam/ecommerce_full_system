import 'package:ecommerceapp/controller/orders/orders_controller.dart';
import 'package:ecommerceapp/core/class/handlind_status_request.dart';
import 'package:ecommerceapp/core/constants/app_routes.dart';
import 'package:ecommerceapp/core/constants/lang_keys.dart';
import 'package:ecommerceapp/view/widgets/orders/order_buttons.dart';
import 'package:ecommerceapp/view/widgets/orders/order_counter.dart';
import 'package:ecommerceapp/view/widgets/orders/order_details.dart';
import 'package:ecommerceapp/view/widgets/orders/order_details_top.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // OrdersController controller =
    Get.put(OrdersController());
    return Scaffold(
        appBar: AppBar(
          title: FittedBox(child: Text(LangKeys.pendingOrders.tr)),
          actions: [OrderCounter(pending: true)],
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
                                OrderDetailsTop(orderModel: orderModel),
                                OrderDetails(orderModel: orderModel),
                                OrderButtons(orderModel: orderModel),
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



