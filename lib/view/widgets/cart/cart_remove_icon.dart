import 'package:ecommerceapp/controller/cart_controller.dart';
import 'package:ecommerceapp/core/constants/image_assets.dart';
import 'package:ecommerceapp/data/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CartRemoveIcon extends GetView<CartController> {
  final CartModel cartItem;
  const CartRemoveIcon({
    required this.cartItem,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 10,
      onPressed: () {
        Get.defaultDialog(
          title: "warn",
          content: Text(
            "do you agreed to remove ${cartItem.itemsNameEn} from cart",
            textAlign: TextAlign.center,
          ),
          onCancel: () {},
          onConfirm: () {
            controller.deleteFromCart(cartItem.itemsId!);

            Navigator.pop(context);
          },
        );
      },
      color: const Color.fromARGB(177, 244, 54, 57),
      icon: SvgPicture.asset(
        SvgAssets.cancelOutline,
        color: const Color.fromARGB(255, 255, 17, 0),
        height: 20,
      ),
    );
  }
}
