import 'package:adminapp/controller/orders_controller.dart';
import 'package:adminapp/data/data_source/static/order_appbar.dart';
import 'package:adminapp/view/widgets/orders/navigation_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersBottomAppBar extends GetView<OrdersController> {
  const OrdersBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
      margin: EdgeInsets.symmetric(horizontal: 10),

      child: BottomAppBar(
        clipBehavior: Clip.hardEdge,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
        height: 62,
        // color: const Color.fromARGB(225, 218, 194, 9),
        child: Column(
          children: [
            Row(
              children: [
                ...List.generate(ordersBottomAppbarList.length, (index) {
                  // int i = index > 2 ? index - 1 : index;
                  return OrdersBottomAppbarButton(
                    isActive: controller.currentIndex.value == index,
                    title: ordersBottomAppbarList[index].title.tr,
                    icon: ordersBottomAppbarList[index].icon,
                    onPressed: () {
                      if (controller.currentIndex.value != index) {
                        ordersBottomAppbarList[index].onPressed!();
                      }
                      controller.changePage(index);
                    },
                  );
                }),
              ],
            ),
            Divider(thickness: 3, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
