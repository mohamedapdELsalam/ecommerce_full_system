import 'package:ecommerceapp/controller/homepage_controller.dart';
import 'package:ecommerceapp/core/constants/apiLink.dart';
import 'package:ecommerceapp/data/data_source/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      height: appWidth < 1200 ? appHeight * 0.2 : appHeight * 0.25,
      child: ListView.builder(
        controller: controller.scrollcontroller,
        scrollDirection: Axis.horizontal,
        itemCount: controller.items_discount.length,
        itemBuilder: (context, i) {
          return Stack(
            children: [
              Container(
                  width: appWidth >= 1200 ? appWidth * 0.2 : appWidth * 0.8,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: myColors.primary,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      "${ApiLinks.itemRoot}/${controller.items_discount[i]["items_image"]}",
                      fit: BoxFit.cover,
                    ),
                  )),
              Positioned(
                  left: 20,
                  bottom: 20,
                  child: Container(
                    height: appHeight * 0.07,
                    width: appHeight * 0.07,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(125, 205, 202, 202),
                        borderRadius: BorderRadius.circular(100)),
                    child: Center(
                      child: Text(
                        "${controller.items_discount[i]["items_discount"]} %",
                        style:
                            TextStyle(color: myColors.secondary, fontSize: 20),
                      ),
                    ),
                  )),
            ],
          );
        },
      ),
    );
  }
}
