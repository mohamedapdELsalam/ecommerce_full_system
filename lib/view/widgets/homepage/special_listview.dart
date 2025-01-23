import 'package:ecommerceapp/controller/homepage_controller.dart';
import 'package:ecommerceapp/data/data_source/static/static.dart';
import 'package:flutter/material.dart';

class SpecialListview extends StatelessWidget {
  const SpecialListview({
    super.key,
    required this.appHeight,
    required this.controller,
    required this.appWidth,
    required this.myColors,
  });

  final double appHeight;
  final HomePageController controller;
  final double appWidth;
  final ColorScheme myColors;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: appHeight * 0.2,
      child: ListView.builder(
        controller: controller.scrollcontroller,
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, i) {
          return Container(
              width: appWidth >= 1200 ? appWidth * 0.4 : appWidth * 0.8,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: myColors.primary,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  SpecialForYouList[i].image!,
                  fit: BoxFit.cover,
                ),
              ));
        },
      ),
    );
  }
}
