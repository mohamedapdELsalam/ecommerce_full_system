import 'package:ecommerceapp/controller/items/item_details_controller.dart';
import 'package:ecommerceapp/core/extensions/context_extensions.dart';
import 'package:ecommerceapp/core/functions/transulateDatabase.dart';
import 'package:ecommerceapp/view/widgets/itemDetails/bottom_item_details.dart';
import 'package:ecommerceapp/view/widgets/itemDetails/item_detail_counter.dart';
import 'package:ecommerceapp/view/widgets/itemDetails/small_addtocart_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemDetailsColumn extends StatelessWidget {
  const ItemDetailsColumn({super.key, required this.controller});
  final ItemsDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ItemName(controller: controller),
          ItemDesc(controller: controller),
          FinalPrice(controller: controller),
          Container(
            child: Row(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BottomItemDetails(),
                  ItemDetailsCounter(),
                  SmallAddToCartButton(title: "add to cart"),
                ],
              ),
              Spacer(),
            ]),
          ),
        ],
      ),
    );
  }
}

class FinalPrice extends StatelessWidget {
  const FinalPrice({
    super.key,
    required this.controller,
  });

  final ItemsDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ItemPrice(controller: controller),
          SizedBox(width: 5),
          OldPrice(controller: controller),
        ],
      ),
    );
  }
}

class ItemDesc extends StatelessWidget {
  const ItemDesc({
    super.key,
    required this.controller,
  });

  final ItemsDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Text(
      translateDatabase(
          controller.item.itemsDescAr!,
          controller.item.itemsDescEn!,
          controller.item.itemsDescDe!,
          controller.item.itemsDescSp!),
      style: context.textTheme.titleSmall!.copyWith(color: context.onSecondary),
    );
  }
}

class ItemName extends StatelessWidget {
  const ItemName({
    super.key,
    required this.controller,
  });

  final ItemsDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Text(
      translateDatabase(
          controller.item.itemsNameAr!,
          controller.item.itemsNameEn!,
          controller.item.itemsNameDe!,
          controller.item.itemsNameSp!),
      style:
          context.textTheme.titleMedium!.copyWith(color: context.primaryColor),
      textAlign: TextAlign.start,
    );
  }
}

class OldPrice extends StatelessWidget {
  const OldPrice({
    super.key,
    required this.controller,
  });

  final ItemsDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Text(
      " ${controller.item.itemsPrice} LE",
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          decoration: TextDecoration.lineThrough, color: Colors.blueGrey),
    );
  }
}

class ItemPrice extends StatelessWidget {
  const ItemPrice({
    super.key,
    required this.controller,
  });

  final ItemsDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "${controller.item.finalPrice}",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Theme.of(context).colorScheme.primary),
        ),
        Text(
          " LE ".tr,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Theme.of(context).colorScheme.primary),
        ),
      ],
    );
  }
}
