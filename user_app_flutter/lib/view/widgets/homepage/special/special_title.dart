import 'package:ecommerceapp/controller/homescreen_controller.dart';
import 'package:ecommerceapp/core/constants/lang_keys.dart';
import 'package:ecommerceapp/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpecialTitle extends StatelessWidget {
  const SpecialTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
      child: Row(
        children: [
          Text(
            LangKeys.specialForYou.tr,
            style: context.textTheme.titleMedium!
                .copyWith(color: context.onSecondary),
          ),
          const Spacer(),
          TextButton(
              onPressed: () {
                HomeScreenController controller = Get.find();
                controller.changePage(1);
              },
              child: Text(
                LangKeys.seeAll.tr,
                style: TextStyle(color: context.onSecondary),
              ))
        ],
      ),
    );
  }
}
