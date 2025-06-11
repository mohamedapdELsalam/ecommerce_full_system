import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopAppbarFavorite extends StatelessWidget {
  const TopAppbarFavorite({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var myColors = Get.theme.colorScheme;
    var myTheme = Get.theme;
    return Row(
      children: [
        FittedBox(
            child: Text("favorite".tr,
                style: myTheme.textTheme.headlineMedium!
                    .copyWith(color: myColors.onPrimary))),
        const Spacer(),
      ],
    );
  }
}
