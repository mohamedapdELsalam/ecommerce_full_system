import 'package:ecommerceapp/core/constants/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoApp extends StatelessWidget {
  final double bottomMargin;
  final double hight;
  final double width;
  LogoApp(
      {super.key,
      required this.bottomMargin,
      required this.hight,
      required this.width});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: bottomMargin, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            ImageAssets.mzLogo,
            height: hight,
            width: width,
          ),
          Text.rich(
            TextSpan(children: [
              TextSpan(text: "Muzn", style: TextStyle(color: Colors.cyan[900])),
              TextSpan(text: " Store"),
            ]),
            style: TextStyle(fontFamily: "Merienda", fontSize: 30),
          ),
        ],
      ),
    );
  }
}
