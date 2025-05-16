import 'package:ecommerceapp/controller/items/item_details_controller.dart';
import 'package:ecommerceapp/core/functions/transulateDatabase.dart';
import 'package:ecommerceapp/view/widgets/itemDetails/small_addtocart_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemDetailsColumn extends StatelessWidget {
  const ItemDetailsColumn({
    super.key,
    required this.controller,
  });

  final ItemsDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            translateDatabase(
                controller.item.itemsNameAr,
                controller.item.itemsNameEn,
                controller.item.itemsNameDe,
                controller.item.itemsNameSp),
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Theme.of(context).colorScheme.secondary),
            textAlign: TextAlign.start,
          ),
          Text(
              translateDatabase(
                  controller.item.itemsDescAr,
                  controller.item.itemsDescEn,
                  controller.item.itemsDescDe,
                  controller.item.itemsDescSp),
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color:
                      Theme.of(context).colorScheme.onSurface.withAlpha(200))),
          Container(
            padding: EdgeInsets.only(top: 20),
            child: Row(children: [
              Text(
                "${controller.item.finalPrice}",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: Theme.of(context).colorScheme.secondary),
              ),
              Text(
                " LE ".tr,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: Theme.of(context).colorScheme.secondary),
              ),
              Spacer(),
              smallAddToCartButton()
            ]),
          ),
          Text(
            " ${controller.item.itemsPrice}",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                decoration: TextDecoration.lineThrough,
                color: const Color.fromARGB(255, 220, 15, 15)),
          ),
        ],
      ),
    );
  }
}
