import 'package:ecommerceapp/core/screen_dimensions.dart';
import 'package:ecommerceapp/view/widgets/homepage/appbar/appbar_mobile_bottom.dart';
import 'package:ecommerceapp/view/widgets/homepage/appbar/appbar_mobile_top.dart';
import 'package:flutter/material.dart';

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
    var myColors = Theme.of(context).colorScheme;
    // var myTheme = Get.theme;
    //outside container
    return Container(
      padding: Responsible.isMobile(context)
          ? EdgeInsets.only(top: 20)
          : EdgeInsets.only(top: 10),
      width: appWidth,
      height: Responsible.isDesktop(context)
          ? appHeight * 0.25
          : Responsible.isMobile(context)
              ? appHeight * 0.2
              : Responsible.isPortrait(context)
                  ? appHeight * 0.35
                  : appHeight * 0.25,
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
              vertical: appHeight - (appHeight - 15),
            ),
            child: Column(
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
