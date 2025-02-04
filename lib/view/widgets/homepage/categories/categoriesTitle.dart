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
          Flexible(
            flex: 4,
            child: Text(
              "42".tr,
              style: myTheme.textTheme.titleMedium!
                  .copyWith(color: mycolors.onSecondary), // استخدام الثيم هنا
            ),
          ),
          Spacer(
            flex: 5,
          ),
          Flexible(flex: 1, child: FittedBox(child: Text("44".tr)))
        ],
      ),
    );
  }
}
