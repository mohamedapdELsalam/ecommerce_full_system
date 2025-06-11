import 'package:adminapp/controller/orders/pending_controller.dart';
import 'package:adminapp/core/class/handlind_status_request.dart';
import 'package:adminapp/view/widgets/orders/order_buttons.dart';
import 'package:adminapp/view/widgets/orders/order_details.dart';
import 'package:adminapp/view/widgets/orders/order_details_top.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PendingOrdersScreen extends StatelessWidget {
  const PendingOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // PendingOrdersController controller =
    Get.put(PendingOrdersController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            GetBuilder<PendingOrdersController>(
              builder:
                  (controller) => HandlingStatusRequest(
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
                                PendingOrderButtons(orderModel: orderModel),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
