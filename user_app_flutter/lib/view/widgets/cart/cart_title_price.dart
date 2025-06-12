import 'package:ecommerceapp/controller/cart_controller.dart';
import 'package:ecommerceapp/core/extensions/context_extensions.dart';
import 'package:ecommerceapp/core/functions/transulateDatabase.dart';
import 'package:ecommerceapp/view/widgets/itemDetails/procuct_color_cirlce.dart';
import 'package:ecommerceapp/view/widgets/itemDetails/product_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartTitleAndPrice extends GetView<CartController> {
  final int index;
  const CartTitleAndPrice({
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            translateDatabase(
                controller.cartItems[index].itemsNameAr!,
                controller.cartItems[index].itemsNameEn!,
                controller.cartItems[index].itemsNameDe!,
                controller.cartItems[index].itemsNameSp!),
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: Theme.of(context).colorScheme.onSecondary),
          ),
          Text("${controller.cartItems[index].finalPrice}\$",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: context.onSecondary)),
          SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (controller.cartItems[index].colorsHexcode != null)
                Transform.scale(
                  scale: 0.8,
                  child: ProductColorCircle(
                      color: Color(int.parse(controller
                          .cartItems[index].colorsHexcode!
                          .replaceFirst('#', '0xFF'))),
                      isSelected: false,
                      colorId: controller.cartItems[index].colorsId!),
                ),
              if (controller.cartItems[index].sizesLabel != null)
                Transform.scale(
                  scale: 0.8,
                  child: ProductSize(
                      size: controller.cartItems[index].sizesLabel!,
                      sizeId: controller.cartItems[index].sizesId!,
                      isSelected: false),
                ),
              Spacer(),
              Text(
                  "${controller.cartItems[index].finalPrice! * controller.cartCount[index]}\$",
                  style: context.textTheme.bodySmall!
                      .copyWith(color: context.errorColor)),
            ],
          )
        ],
      ),
    );
  }
}
