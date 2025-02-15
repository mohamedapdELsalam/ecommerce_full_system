import 'package:ecommerceapp/core/constants/image_assets.dart';
import 'package:flutter/material.dart';

class CartItemImage extends StatelessWidget {
  const CartItemImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(topRight: Radius.circular(20)),
      child: Image.asset(
        ImageAssets.product2,
        fit: BoxFit.cover,
        height: 80,
      ),
    );
  }
}
