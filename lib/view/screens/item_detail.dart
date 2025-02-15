import 'package:ecommerceapp/controller/item_details_controller.dart';
import 'package:ecommerceapp/core/screen_dimensions.dart';
import 'package:ecommerceapp/view/widgets/itemDetails/addtocart_button.dart';
import 'package:ecommerceapp/view/widgets/itemDetails/bottom_item_details.dart';
import 'package:ecommerceapp/view/widgets/itemDetails/itemdetails_stack.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class itemDetails extends StatelessWidget {
  const itemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsDetailsController controller = Get.put(ItemsDetailsController());
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
        child: AddToCartButton(),
      ),
      body: Container(
        child: ListView(
          children: [
            // row only in desktop
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 600,
                    child: ItemDetailsStack(controller: controller),
                  ),
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
            BottomItemDetails(),
          ],
        ),
      ),
    );
  }
}
