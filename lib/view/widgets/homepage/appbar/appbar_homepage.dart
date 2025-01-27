import 'package:ecommerceapp/view/widgets/homepage/appbar/bottom_appbar.dart';
import 'package:ecommerceapp/view/widgets/homepage/appbar/top_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'circle_dots.dart';
import 'curvyLines.dart';

class AppbarHomepage extends StatelessWidget {
  const AppbarHomepage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var appHeight = MediaQuery.of(context).size.height;
    var appWidth = MediaQuery.of(context).size.width;
    var myColors = Get.theme.colorScheme;
    // var myTheme = Get.theme;
    //outside container
    return Container(
      width: appWidth,
      height: appWidth < 1200 ? appHeight * 0.25 : appHeight * 0.25,
      decoration: BoxDecoration(
          color: myColors.primary,
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(28))),
      child: Stack(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        children: [
          const curvyLines(),
          const CircleDots(),
          //inside content
          Container(
            constraints: BoxConstraints(minWidth: 100, minHeight: 100),
            margin: EdgeInsets.symmetric(
              horizontal: appWidth - (appWidth - 30),
              vertical: appHeight - (appHeight - 10),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(child: TopAppBarHomepage()),
                Flexible(child: BottomAppbarHomepage())
              ],
            ),
          ),
        ],
      ),
    );
  }
}
