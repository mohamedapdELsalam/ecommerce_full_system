import 'package:adminapp/controller/orders/accepted_controller.dart';
import 'package:adminapp/core/class/handlind_status_request.dart';
import 'package:adminapp/view/widgets/orders/accepted_buttons.dart';
import 'package:adminapp/view/widgets/orders/order_details.dart';
import 'package:adminapp/view/widgets/orders/order_details_top.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AcceptedOrders extends StatelessWidget {
  const AcceptedOrders({super.key});

  @override
  Widget build(BuildContext context) {
    //  AcceptedOrdersController controller =
    Get.put(AcceptedOrdersController());

    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 243, 238, 238),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(height: 5),
            GetBuilder<AcceptedOrdersController>(
              builder:
                  (controller) => HandlingStatusRequest(
                    controller: controller,
                    statusRequest: controller.statusRequest,
                    widget: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.acceptedOrders.length,
                      itemBuilder: (context, i) {
                        var orderModel = controller.acceptedOrders[i];
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                OrderDetailsTop(orderModel: orderModel),
                                OrderDetails(orderModel: orderModel),
                                AcceptedOrderButtons(orderModel: orderModel),
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

// class OrdersCounter extends StatelessWidget {
//   const OrdersCounter({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<OrdersController>(
//       builder:
//           (controller) =>
//               Text("${controller.pendingController.pendingOrders.length}"),
//     );
//   }
// }
