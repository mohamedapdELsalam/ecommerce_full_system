import 'package:adminapp/controller/items/view_items_controller.dart';
import 'package:adminapp/core/class/handlind_status_request.dart';
import 'package:adminapp/core/constants/app_routes.dart';
import 'package:adminapp/view/widgets/items_gridview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    ItemsViewController controller = Get.put(ItemsViewController());
    //double appHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var result = await Get.toNamed(AppRoutes.addItem);
          if (result == "refresh") {
            controller.getItems();
          }
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(title: Text("products")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GetBuilder<ItemsViewController>(
              builder:
                  (controller) => HandlingStatusRequestWithData(
                    statusRequest: controller.statusRequest,
                    widget: itemsGridView(),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
