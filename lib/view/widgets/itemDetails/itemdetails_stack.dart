import 'package:ecommerceapp/controller/item_details_controller.dart';
import 'package:ecommerceapp/view/widgets/homepage/most_sell_products.dart';
import 'package:ecommerceapp/view/widgets/itemDetails/image_itemdetails.dart';
import 'package:ecommerceapp/view/widgets/itemDetails/item_details_column.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemDetailsStack extends StatelessWidget {
  const ItemDetailsStack({
    super.key,
    required this.controller,
  });

  final ItemsDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
        )),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: ImageItemDetails(controller: controller),
            ),
            Expanded(
              child: ItemDetailsColumn(controller: controller),
            )
          ],
        ),
        GetBuilder<ItemsDetailsController>(
            builder: (controller) => FavoriteIcon(controller))
      ],
    );
  }
}
