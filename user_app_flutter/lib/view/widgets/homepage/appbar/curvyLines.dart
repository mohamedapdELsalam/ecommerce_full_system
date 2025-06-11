import 'package:ecommerceapp/core/constants/image_assets.dart';
import 'package:flutter/material.dart';

class curvyLines extends StatelessWidget {
  const curvyLines({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      height: 200,
      width: 130,
      right: 20,
      child: Opacity(
        opacity: 0.2,
        child: Image.asset(
          ImageAssets.curvLines,
          fit: BoxFit.contain,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    );
  }
}
