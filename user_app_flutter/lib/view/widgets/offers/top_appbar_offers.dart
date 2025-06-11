import 'package:ecommerceapp/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopAppbarOffers extends StatelessWidget {
  const TopAppbarOffers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FittedBox(
            child: Text("offers".tr,
                style: context.textTheme.headlineMedium!
                    .copyWith(color: context.onPrimaryColor))),
        const Spacer(),
      ],
    );
  }
}
