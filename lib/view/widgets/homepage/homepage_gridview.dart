import 'package:ecommerceapp/controller/homepage_controller.dart';
import 'package:ecommerceapp/core/constants/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GridViewHomepage extends GetView<HomePageController> {
  const GridViewHomepage({
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
      height: controller.items.length * 150, // تحديد ارتفاع GridView
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 2,
            crossAxisCount: appWidth >= 1200 ? 4 : 2,
            childAspectRatio: 2 / 3),
        itemCount: controller.items.length,
        itemBuilder: (BuildContext context, int i) {
          return SizedBox(
            child: Card(
              color: const Color.fromARGB(250, 251, 252, 252),
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      child: Stack(
                        children: [
                          Positioned(
                            right: 0,
                            left: 0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                ImageAssets.product1,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 5,
                            top: 5,
                            child: GetBuilder<HomePageController>(
                              builder: (controller) => IconButton(
                                onPressed: () {
                                  controller.switchFavorite();
                                },
                                icon: Icon(
                                  controller.isFavorite
                                      ? Icons.favorite_border_outlined
                                      : Icons.favorite,
                                  color: myColors.error,
                                ),
                                iconSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: ListTile(
                      title: Text("${controller.items[i]["items_name_en"]}"),
                      subtitle:
                          Text("${controller.items[i]["items_price"]} LE"),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
