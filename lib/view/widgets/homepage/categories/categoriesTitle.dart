import 'package:ecommerceapp/core/constants/lang_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesTitle extends StatelessWidget {
  const CategoriesTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData myTheme = Theme.of(context);

    ColorScheme mycolors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
      child: Row(
        children: [
          FittedBox(
            child: Text(
              LangKeys.categories.tr,
              style: myTheme.textTheme.titleLarge!.copyWith(
                color: mycolors.onSecondary,
              ), // استخدام الثيم هنا
            ),
          ),
          Spacer(),
          FittedBox(child: Text(LangKeys.seeAll.tr))
        ],
      ),
    );
  }
}

class TopSellingTitle extends StatelessWidget {
  const TopSellingTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData myTheme = Theme.of(context);

    ColorScheme mycolors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
      child: Row(
        children: [
          Text(
            LangKeys.topSelling.tr,
            style: myTheme.textTheme.titleLarge!
                .copyWith(color: mycolors.onSecondary), // استخدام الثيم هنا
          ),
          Spacer(),
          FittedBox(child: Text(LangKeys.seeAll.tr))
        ],
      ),
    );
  }
}
