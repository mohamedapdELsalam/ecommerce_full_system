import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/controller/homepage_controller.dart';
import 'package:ecommerceapp/core/constants/api_links.dart';
import 'package:ecommerceapp/core/constants/app_routes.dart';
import 'package:ecommerceapp/core/screen_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpecialListView extends GetView<HomePageController> {
  const SpecialListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var myColors = Theme.of(context).colorScheme;
    double appHeight = MediaQuery.of(context).size.height;
    double appWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: Responsible.isDesktop(context)
          ? appHeight * 0.25
          : Responsible.isMobile(context)
              ? appHeight * 0.2
              : Responsible.isPortrait(context)
                  ? appHeight * 0.35
                  : appHeight * 0.25,
      child: ListView.builder(
        controller: controller.scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, i) {
          return InkWell(
            onTap: () {
              Get.toNamed(AppRoutes.itemDetails,
                  arguments: {"item": controller.items[i]});
            },
            child: Stack(
              children: [
                Container(
                    height: Responsible.isDesktop(context)
                        ? appHeight * 0.25
                        : Responsible.isMobile(context)
                            ? appHeight * 0.15
                            : Responsible.isPortrait(context)
                                ? appHeight * 0.35
                                : appHeight * 0.25,
                    width: Responsible.isDesktop(context)
                        ? appWidth * 0.2
                        : Responsible.isMobile(context)
                            ? appWidth * 0.55
                            : Responsible.isPortrait(context)
                                ? appWidth * 0.3
                                : appWidth * 0.2,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: myColors.primary,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CachedNetworkImage(
                        imageUrl:
                            "${ApiLinks.itemImageRoot}/${controller.itemsDiscount[i]["items_image"]}",
                        fit: BoxFit.cover,
                      ),
                    )),
                Positioned(
                    left: 20,
                    bottom: 35,
                    child: CircleAvatar(
                      child: Center(
                        child: Text(
                          "${controller.itemsDiscount[i]["items_discount"]} %",
                          style: TextStyle(
                              color: myColors.onPrimary, fontSize: 15),
                        ),
                      ),
                    )),
              ],
            ),
          );
        },
      ),
    );
  }
}
