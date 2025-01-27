import 'package:ecommerceapp/controller/homepage_controller.dart';
import 'package:ecommerceapp/core/constants/apiLink.dart';
import 'package:ecommerceapp/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsGridView extends GetView<HomePageController> {
  const ProductsGridView({
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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),

      height: controller.items_discount.length * 150, // تحديد ارتفاع GridView
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 2,
            crossAxisCount: appWidth >= 1200
                ? 5
                : appWidth >= 900
                    ? 4
                    : appWidth >= 700
                        ? 3
                        : 2,
            childAspectRatio: 2 / 3),
        itemCount: controller.items.length,
        itemBuilder: (BuildContext context, int i) {
          return SizedBox(
            child: Card(
              color: const Color.fromARGB(249, 241, 243, 243),
              child: Items(
                  itemModel: ItemsModel.fromJson(controller.items[i]),
                  controller: controller,
                  myColors: myColors),
            ),
          );
        },
      ),
    );
  }
}

class Items extends StatelessWidget {
  Items({
    super.key,
    required this.controller,
    required this.myColors,
    required this.itemModel,
  });
  final ItemsModel itemModel;
  final HomePageController controller;
  final ColorScheme myColors;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                    child: Image.network(
                      "${ApiLinks.itemRoot}/${itemModel.itemsImage}",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  right: 5,
                  top: 5,
                  child: GetBuilder<HomePageController>(
                    builder: (controller) => FavouriteIcon(myColors: myColors),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: ListTile(
            title: Text("${itemModel.categoriesNameEn}"),
            subtitle: Text("${itemModel.itemsPrice} LE"),
          ),
        )
      ],
    );
  }
}

class FavouriteIcon extends GetView<HomePageController> {
  const FavouriteIcon({
    super.key,
    required this.myColors,
  });

  final ColorScheme myColors;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        controller.switchFavorite();
      },
      icon: Icon(
        controller.isFavorite ? Icons.favorite_border_outlined : Icons.favorite,
        color: myColors.error,
      ),
      iconSize: 20,
    );
  }
}
