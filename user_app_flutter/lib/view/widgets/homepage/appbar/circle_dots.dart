import 'package:ecommerceapp/core/constants/image_assets.dart';
import 'package:flutter/material.dart';

class CircleDots extends StatelessWidget {
  const CircleDots({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      height: 200,
      width: 130,
      left: -5,
      bottom: -90,
      child: Opacity(
        opacity: 0.2,
        child: Image.asset(
          ImageAssets.circleDots,
          fit: BoxFit.contain,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    );
  }
}
