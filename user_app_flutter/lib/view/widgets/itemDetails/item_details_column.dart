import 'package:ecommerceapp/controller/items/item_details_controller.dart';
import 'package:ecommerceapp/core/extensions/context_extensions.dart';
import 'package:ecommerceapp/core/functions/transulateDatabase.dart';
import 'package:ecommerceapp/view/widgets/itemDetails/available_colors_sizes.dart';
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
          AvailableColorsAndSizes(),
          SizedBox(height: 10),
          GetBuilder<ItemsDetailsController>(builder: (controller) {
            if (controller.selectedSize != null ||
                controller.itemVariants.isEmpty) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("quantity"),
                  ItemDetailsCounter(),
                ],
              );
            } else {
              return Text("");
            }
          }),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GetBuilder<ItemsDetailsController>(
                builder: (controller) => Text.rich(TextSpan(children: [
                  TextSpan(text: "total price : "),
                  TextSpan(text: controller.totalPrice.toString())
                ])),
              ),
              GetBuilder<ItemsDetailsController>(
                builder: (controller) => AddToCartButton(
                  title: "add to cart",
                  isEnabled: controller.itemVariants.isEmpty ||
                      controller.selectedSize != null,
                  onPressed: () {
                    controller.addToCart();
                  },
                ),
              ),
            ],
          ),
          Spacer(),
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
    return GetBuilder<ItemsDetailsController>(
      builder: (controller) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ItemPrice(controller: controller),
            SizedBox(width: 5),
            OldPrice(controller: controller),
          ],
        ),
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
    print("${controller.selectedStock ?? 0}");
    print("${controller.selectedVariant ?? 0}");
    return Text(
      controller.selectedStock != null &&
              controller.selectedVariant!.variantDiscount! > 0
          ? " ${controller.selectedVariant!.stockPrice} LE"
          : controller.item.itemsDiscount! > 0
              ? " ${controller.item.itemsPrice} LE"
              : "",
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
          controller.selectedStock != null
              ? "${controller.itemVariants[controller.selectedStock!].stockFinalPrice}"
              : "${controller.item.finalPrice}",
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
