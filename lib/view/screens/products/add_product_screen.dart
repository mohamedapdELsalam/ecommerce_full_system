import 'package:adminapp/controller/products/add_product_controller.dart';
import 'package:adminapp/core/shared/main_global_button.dart';
import 'package:adminapp/view/widgets/products/add/add_desc_block.dart';
import 'package:adminapp/view/widgets/products/add/add_image_block.dart';
import 'package:adminapp/view/widgets/products/add/add_name_block.dart';
import 'package:adminapp/view/widgets/products/add/add_price_block.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

class AddItemScreen extends StatelessWidget {
  const AddItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AddProductController controller = Get.put(AddProductController());
    return Scaffold(
      appBar: AppBar(title: Text("add product")),
      body: Card(
        color: Theme.of(context).cardColor,
        margin: EdgeInsets.all(15),
        child: Form(
          key: controller.myGlobalKey,
          child: ListView(
            padding: EdgeInsets.all(20),
            children: [
              AddImageBlock(),
              AddProductNameBlock(),
              AddProductDescBlock(),
              AddProductPriceBlock(),
              GlobalButton(
                onPressed: () {
                
                  controller.addProduct();

                },
                title: "Add Product",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
