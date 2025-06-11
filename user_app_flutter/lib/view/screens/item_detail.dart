import 'package:ecommerceapp/controller/items/item_details_controller.dart';
import 'package:ecommerceapp/core/screen_dimensions.dart';
import 'package:ecommerceapp/view/widgets/itemDetails/addtocart_button.dart';
import 'package:ecommerceapp/view/widgets/itemDetails/itemdetails_stack.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsDetailsController controller = Get.put(ItemsDetailsController());
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        title: Text(
          controller.item.itemsNameEn!,
          style: context.textTheme.bodyLarge,
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
        child: AddToCartButton(
          itemId: controller.item.itemsId!,
        ),
      ),
      body: ListView(
        children: [
          // row only in desktop
          Row(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(height: 900, child: ItemDetailsStack()),
              ),
              if (!Responsible.isMobile(context))
                Expanded(
                  flex: 2,
                  child: Container(
                    width: 500,
                    color: Colors.white,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
