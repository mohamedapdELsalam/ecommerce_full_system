import 'package:adminapp/controller/products/view_product_controller.dart';
import 'package:adminapp/core/class/handlind_status_request.dart';
import 'package:adminapp/core/constants/app_routes.dart';
import 'package:adminapp/view/widgets/products_gridview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    ProductsViewController controller = Get.put(ProductsViewController());
    double appHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var result = await Get.toNamed(AppRoutes.addProducts);
          if (result == "refresh") {
            controller.getProducts();
          }
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(title: Text("products")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GetBuilder<ProductsViewController>(
              builder:
                  (controller) => HandlingStatusRequestWithData(
                    statusRequest: controller.statusRequest,
                    widget: ProductsGridView(),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
