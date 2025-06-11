import 'package:adminapp/controller/orders_controller.dart';
import 'package:adminapp/core/constants/lang_keys.dart';
import 'package:adminapp/core/screen_dimensions.dart';
import 'package:adminapp/view/widgets/orders/bottom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OrdersController controller = Get.put(OrdersController());
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(
            controller.currentIndex.value == 0
                ? LangKeys.pendingOrders.tr
                : controller.currentIndex.value == 1
                ? LangKeys.accepted.tr
                : LangKeys.archiveOrders.tr,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 243, 238, 238),
        resizeToAvoidBottomInset: false,
        body: controller.ordersPages.elementAt(controller.currentIndex.value),

        bottomNavigationBar:
            Responsible.isMobile(context) ? OrdersBottomAppBar() : null,
      ),
    );
  }
}
