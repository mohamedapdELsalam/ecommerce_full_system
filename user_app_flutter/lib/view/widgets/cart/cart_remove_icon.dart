import 'package:ecommerceapp/controller/cart_controller.dart';
import 'package:ecommerceapp/core/constants/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CartRemoveIcon extends GetView<CartController> {
  final cartItem;
  final String title;
  final Widget content;
  final void Function()? onConfirm;

  const CartRemoveIcon({
    required this.cartItem,
    required this.onConfirm,
    required this.title,
    required this.content,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 10,
      onPressed: () {
        Get.defaultDialog(
          title: title,
          content: content,
          onCancel: () {},
          onConfirm: onConfirm,
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
