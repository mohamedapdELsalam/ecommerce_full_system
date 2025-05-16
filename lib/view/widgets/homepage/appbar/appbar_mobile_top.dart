import 'package:ecommerceapp/core/constants/app_routes.dart';
import 'package:ecommerceapp/core/constants/lang_keys.dart';
import 'package:ecommerceapp/core/screen_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopAppBarHomepage extends StatelessWidget {
  const TopAppBarHomepage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var appHeight = Get.size.height;
    // var appWidth = Get.size.width;
    var myColors = Get.theme.colorScheme;
    var myTheme = Get.theme;
    return Row(
      children: [
        FittedBox(
            child: Text(LangKeys.appTitle.tr,
                style: myTheme.textTheme.headlineMedium!
                    .copyWith(color: myColors.onPrimary))),
        const Spacer(),
        Container(
            height: 40,
            decoration: const BoxDecoration(
                color: Color.fromARGB(155, 183, 182, 182),
                borderRadius: BorderRadius.all(Radius.circular(100))),
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.notification);
                    },
                    icon: Icon(
                      Icons.notifications_none_outlined,
                      size: Responsible.isDesktop(context)
                          ? appHeight * 0.25
                          : Responsible.isMobile(context)
                              ? appHeight * 0.028
                              : Responsible.isPortrait(context)
                                  ? appHeight * 0.25
                                  : appHeight * 0.25,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.favoriteScreen);
                    },
                    icon: Icon(
                      Icons.favorite,
                      size: Responsible.isDesktop(context)
                          ? appHeight * 0.25
                          : Responsible.isMobile(context)
                              ? appHeight * 0.028
                              : Responsible.isPortrait(context)
                                  ? appHeight * 0.25
                                  : appHeight * 0.25,
                    ),
                  ),
                ],
              ),
            ))
      ],
    );
  }
}
