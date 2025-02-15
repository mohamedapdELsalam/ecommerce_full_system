import 'package:ecommerceapp/core/constants/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartRemoveIcon extends StatelessWidget {
  const CartRemoveIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 10,
      onPressed: () {},
      color: const Color.fromARGB(177, 244, 54, 57),
      icon: SvgPicture.asset(
        SvgAssets.cancelOutline,
        color: const Color.fromARGB(255, 255, 17, 0),
        height: 20,
      ),
    );
  }
}
