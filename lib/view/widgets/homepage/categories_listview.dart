import 'package:ecommerceapp/controller/homepage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategroiesListView extends GetView<HomePageController> {
  const CategroiesListView({
    super.key,
    required this.appWidth,
    required this.appHeight,
    required this.myColors,
  });

  final double appWidth;
  final double appHeight;
  final ColorScheme myColors;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: appWidth < 1200 ? appHeight * 0.110 : appHeight * 0.18,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (context, i) {
          return Container(
            margin: EdgeInsets.only(right: 15),
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    width:
                        appWidth < 1200 ? appHeight * 0.078 : appHeight * 0.13,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(85, 177, 212, 232),
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: Icon(
                      Icons.shopping_cart_rounded,
                      color: myColors.primary,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Expanded(
                    flex: 1,
                    child: Text(
                      Get.locale!.languageCode == "en"
                          ? "${controller.categories[i]["categories_name_en"]}"
                          : Get.locale!.languageCode == "ar"
                              ? "${controller.categories[i]["categories_name_ar"]}"
                              : Get.locale!.languageCode == "de"
                                  ? "${controller.categories[i]["categories_name_de"]}"
                                  : "${controller.categories[i]["categories_name_sp"]}",
                      textAlign: TextAlign.center,
                    )),
              ],
            ),
          );
        },
      ),
    );
  }
}
