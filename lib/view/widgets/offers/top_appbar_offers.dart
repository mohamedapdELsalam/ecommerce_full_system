import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopAppbarOffers extends StatelessWidget {
  const TopAppbarOffers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var myColors = Get.theme.colorScheme;
    var myTheme = Get.theme;
    return Row(
      children: [
        FittedBox(
            child: Text("offers".tr,
                style: myTheme.textTheme.headlineMedium!
                    .copyWith(color: myColors.onPrimary))),
        const Spacer(),
      ],
    );
  }
}
