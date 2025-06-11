import 'package:ecommerceapp/core/screen_dimensions.dart';
import 'package:ecommerceapp/view/widgets/favorites/top_appbar_favorite.dart';
import 'package:ecommerceapp/view/widgets/homepage/appbar/circle_dots.dart';
import 'package:ecommerceapp/view/widgets/homepage/appbar/curvyLines.dart';
import 'package:flutter/material.dart';

class AppBarFavorite extends StatelessWidget {
  final controller;

  const AppBarFavorite({
    required this.controller,
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
          ? EdgeInsets.only(top: 15)
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
            margin: EdgeInsets.symmetric(
              horizontal: appWidth - (appWidth - 30),
              vertical: 2,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(child: TopAppbarFavorite()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
