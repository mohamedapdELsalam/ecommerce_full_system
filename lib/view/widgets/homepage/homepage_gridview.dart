import 'package:ecommerceapp/controller/homepage_controller.dart';
import 'package:ecommerceapp/core/constants/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GridViewHomepage extends StatelessWidget {
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
      height: appWidth < 1200
          ? 20 / 2 * appHeight * 0.23
          : 20 / 4 * appHeight * 0.23 + 1000, // تحديد ارتفاع GridView
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 2, crossAxisCount: appWidth >= 1200 ? 4 : 2),
        itemCount: 20,
        itemBuilder: (i, context) {
          return LayoutBuilder(builder: (context, constraints) {
            double cardHight = constraints.maxHeight;
            print(cardHight);
            print(appHeight * 0.23);
            print(appHeight * 0.60);
            return Card(
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
                          color: myColors.primary,
                        ),
                        iconSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            );
          });
        },
      ),
    );
  }
}
