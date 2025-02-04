import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/controller/homepage_controller.dart';
import 'package:ecommerceapp/core/constants/apiLink.dart';
import 'package:ecommerceapp/core/functions/transulateDatabase.dart';
import 'package:ecommerceapp/core/screen_dimensions.dart';
import 'package:ecommerceapp/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MostSellProducts extends GetView<HomePageController> {
  const MostSellProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme myColors = Theme.of(context).colorScheme;
    double appWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: controller.items.length * 150.6,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
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
            child: InkWell(
              onTap: () {
                //   controller.openItemDetail();
              },
              child: Card(
                color: myColors.surface,
                child: Items(
                    itemModel: ItemsModel.fromJson(controller.items[i]),
                    controller: controller,
                    myColors: myColors),
              ),
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
  final controller;
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
                    child: CachedNetworkImage(
                      imageUrl:
                          "${ApiLinks.itemImageRoot}/${itemModel.itemsImage}",
                      height: Responsible.isDesktop(context)
                          ? MediaQuery.of(context).size.height * 0.4
                          : Responsible.isMobile(context)
                              ? MediaQuery.of(context).size.height * 0.2
                              : Responsible.isPortrait(context)
                                  ? MediaQuery.of(context).size.height * 0.5
                                  : MediaQuery.of(context).size.height * 0.3,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  right: 5,
                  top: 5,
                  child: GetBuilder<HomePageController>(
                    builder: (controller) => FavoriteIcon(controller),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: ListTile(
            title: Text(
              textAlign: TextAlign.center,
              translateDatabase(
                itemModel.itemsNameAr,
                itemModel.itemsNameEn,
                itemModel.itemsNameDe,
                itemModel.itemsNameSp,
              ),
              style: TextStyle(
                  color: myColors.onError, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "${itemModel.itemsPrice} LE",
              style: TextStyle(
                  color: myColors.onSecondary, fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}

class FavoriteIcon extends StatelessWidget {
  final controller;
  const FavoriteIcon(
    this.controller,
  );

  @override
  Widget build(BuildContext context) {
    ColorScheme myColors = Theme.of(context).colorScheme;
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
