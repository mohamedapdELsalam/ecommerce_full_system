import 'package:ecommerceapp/core/screen_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopAppBarHomepage extends StatelessWidget {
  final String title;
  const TopAppBarHomepage({
    required this.title,
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
            child: Text(title.tr,
                style: myTheme.textTheme.headlineMedium!
                    .copyWith(color: myColors.onPrimary))),
        const Spacer(),
        FittedBox(
            child: Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(98, 255, 255, 255),
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.notifications_none_outlined,
                    size: Responsible.isDesktop(context)
                        ? appHeight * 0.25
                        : Responsible.isMobile(context)
                            ? appHeight * 0.03
                            : Responsible.isPortrait(context)
                                ? appHeight * 0.25
                                : appHeight * 0.25,
                  ),
                )))
      ],
    );
  }
}
