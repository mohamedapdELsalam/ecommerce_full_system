import 'package:ecommerceapp/controller/cart_controller.dart';
import 'package:ecommerceapp/core/constants/lang_keys.dart';
import 'package:ecommerceapp/view/widgets/cart/cart_counter.dart';
import 'package:ecommerceapp/view/widgets/cart/cart_item_image.dart';
import 'package:ecommerceapp/view/widgets/cart/cart_remove_icon.dart';
import 'package:ecommerceapp/view/widgets/cart/cart_title_price.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartItem extends GetView<CartController> {
  final int index;
  const CartItem({
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: Stack(
        children: [
          InkWell(
            onTap: () {},
            child: Card(
                color: Theme.of(context).colorScheme.onPrimary,
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              flex: 5,
                              child: CartItemImage(
                                i: index,
                              )),
                          Expanded(
                              flex: 2,
                              child: CartCounterAndTotal(
                                i: index,
                              ))
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            CartTitleAndPrice(index: index),
                          ],
                        )),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                )),
          ),
          Positioned(
              right: 10,
              top: 5,
              child: CartRemoveIcon(
                  onConfirm: () {
                    controller
                        .deleteFromCart(controller.cartItems[index].itemsId!);
                    Navigator.pop(context);
                  },
                  title: LangKeys.warn.tr,
                  content: Text(
                    "do you agreed to remove ${controller.cartItems[index].itemsNameEn} from cart",
                    textAlign: TextAlign.center,
                  ),
                  cartItem: controller.cartItems[index])),
        ],
      ),
    );
  }
}

