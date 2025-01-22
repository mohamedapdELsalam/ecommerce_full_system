import 'package:ecommerceapp/view/widgets/homepage/appbar/bottom_appbar.dart';
import 'package:ecommerceapp/view/widgets/homepage/appbar/top_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'circle_dots.dart';
import 'curvyLines.dart';

class appbarHomepage extends StatelessWidget {
  const appbarHomepage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var appHeight = Get.size.height;
    var appWidth = Get.size.width;
    var myColors = Get.theme.colorScheme;
    // var myTheme = Get.theme;
    //outside container
    return Container(
      width: appWidth,
      height: appHeight * 0.25,
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
            margin: EdgeInsets.fromLTRB(20, appWidth < 1200 ? 50 : 10, 20, 10),
            // height: appHeight * 0.28 - 80,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [TopAppBarHomepage(), BottomAppbarHomepage()],
            ),
          ),
        ],
      ),
    );
  }
}
