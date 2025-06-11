import 'package:ecommerceapp/core/constants/lang_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpecialTitle extends StatelessWidget {
  const SpecialTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme mycolors = Theme.of(context).colorScheme;
    ThemeData myTheme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
      child: Row(
        children: [
          Text(
            LangKeys.specialForYou.tr,
            style: myTheme.textTheme.titleMedium!
                .copyWith(color: mycolors.onSecondary), // استخدام الثيم هنا
          ),
          const Spacer(),
          Text(LangKeys.seeAll.tr)
        ],
      ),
    );
  }
}
