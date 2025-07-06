import 'package:adminapp/controller/items/edit_item_controller.dart';
import 'package:adminapp/core/shared/main_global_button.dart';
import 'package:adminapp/view/widgets/items/edit/edit_desc_block.dart';
import 'package:adminapp/view/widgets/items/edit/edit_image_block.dart';
import 'package:adminapp/view/widgets/items/edit/edit_name_block.dart';
import 'package:adminapp/view/widgets/items/edit/edit_price_block.dart';
import 'package:adminapp/view/widgets/items/edit/variants/variant_expansion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditItemScreen extends StatelessWidget {
  const EditItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    EditItemController controller = Get.put(EditItemController());
    return Scaffold(
      appBar: AppBar(title: Text("edit product")),
      body: Card(
        color: Theme.of(context).cardColor,
        margin: EdgeInsets.all(15),
        child: Form(
          key: controller.myFormKey,
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(20),
            children: [
              EditImageBlock(),
              EditProductNameBlock(),
              EditProductDescBlock(),
              EditProductPriceBlock(),
              VariantExpansionTileEdit(),
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
