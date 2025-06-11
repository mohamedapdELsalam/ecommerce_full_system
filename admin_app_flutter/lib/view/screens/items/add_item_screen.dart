import 'package:adminapp/controller/items/add_item_controller.dart';
import 'package:adminapp/view/widgets/items/add/add_button.dart';
import 'package:adminapp/view/widgets/items/add/add_desc_block.dart';
import 'package:adminapp/view/widgets/items/add/add_image_block.dart';
import 'package:adminapp/view/widgets/items/add/add_name_block.dart';
import 'package:adminapp/view/widgets/items/add/add_price_block.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddItemScreen extends StatelessWidget {
  const AddItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AddItemController controller = Get.put(AddItemController());
    return Scaffold(
      appBar: AppBar(title: Text("add product")),
      body: Card(
        color: context.theme.cardColor,
        margin: EdgeInsets.all(15),
        child: Form(
          key: controller.formKey,
          child: ListView(
            padding: EdgeInsets.all(20),
            children: [
              AddImageBlock(),
              AddProductNameBlock(),
              AddProductDescBlock(),
              AddProductPriceBlock(),
              AddProductButton(),
            ],
          ),
        ),
      ),
    );
  }
}
