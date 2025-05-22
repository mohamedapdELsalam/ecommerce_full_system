import 'package:ecommerceapp/controller/orders/orders_controller.dart';
import 'package:ecommerceapp/core/class/handlind_status_request.dart';
import 'package:ecommerceapp/core/constants/lang_keys.dart';
import 'package:ecommerceapp/core/shared/ratingBar.dart';
import 'package:ecommerceapp/view/widgets/orders/archive_buttons.dart';
import 'package:ecommerceapp/view/widgets/orders/order_counter.dart';
import 'package:ecommerceapp/view/widgets/orders/order_details.dart';
import 'package:ecommerceapp/view/widgets/orders/order_details_top.dart';
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
          title: FittedBox(child: Text(LangKeys.archiveOrders.tr)),
          actions: [OrderCounter(pending: false)],
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
                            OrderDetailsTop(orderModel: orderModel),
                            OrderDetails(orderModel: orderModel),
                            ArchiveButtons(orderModel: orderModel),
                            if (orderModel.ordersRating != 0)
                              ratingBarShow(
                                  context, orderModel.ordersRating!, 25)
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
