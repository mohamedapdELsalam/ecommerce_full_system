import 'package:adminapp/controller/products/edit_product_controller.dart';
import 'package:adminapp/core/shared/main_global_button.dart';
import 'package:adminapp/view/widgets/products/edit/edit_desc_block.dart';
import 'package:adminapp/view/widgets/products/edit/edit_image_block.dart';
import 'package:adminapp/view/widgets/products/edit/edit_name_block.dart';
import 'package:adminapp/view/widgets/products/edit/edit_price_block.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProductScreen extends StatelessWidget {
  const EditProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    EditProductController controller = Get.put(EditProductController());
    return Scaffold(
      appBar: AppBar(title: Text("edit product")),
      body: Card(
        color: Theme.of(context).cardColor,
        margin: EdgeInsets.all(15),
        child: Form(
          key: controller.myGlobalKey,
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(20),
            children: [
              EditImageBlock(),
              EditProductNameBlock(),
              EditProductDescBlock(),
              EditProductPriceBlock(),
              GlobalButton(
                onPressed: () {
                  controller.editProduct();
                },
                title: "Edit Product",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
