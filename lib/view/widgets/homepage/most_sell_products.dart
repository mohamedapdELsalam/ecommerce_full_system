import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/controller/favorite_controller.dart';
import 'package:ecommerceapp/controller/homepage_controller.dart';
import 'package:ecommerceapp/core/constants/apiLink.dart';
import 'package:ecommerceapp/core/functions/transulateDatabase.dart';
import 'package:ecommerceapp/core/screen_dimensions.dart';
import 'package:ecommerceapp/data/data_source/static/static.dart';
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
                // controller.openItemDetail();
              },
              child: Card(
                color: myColors.surface,
                child: MostSellItems(
                    itemModel: ItemsModel.fromJson(controller.items[i]),
                    myColors: myColors),
              ),
            ),
          );
        },
      ),
    );
  }
}

class MostSellItems extends StatelessWidget {
  const MostSellItems({
    super.key,
    required this.myColors,
    required this.itemModel,
  });
  final ItemsModel itemModel;
  final ColorScheme myColors;

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteController());
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
                  child: GetBuilder<FavoriteController>(
                    builder: (controller) => FavoriteIcon(
                      isActive: itemModel.favorite ?? 0,
                      onPressed: () {
                        if (itemModel.favorite == 0) {
                          itemModel.favorite = 1;
                          favController.addToFavorite(
                              itemModel.itemsId!, itemModel.itemsNameAr!);
                        } else {
                          itemModel.favorite = 0;
                          favController.deleteFromFavorite(
                              itemModel.itemsId!, itemModel.itemsNameAr!);
                        }
                      },
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
  final int isActive;
  final void Function()? onPressed;
  const FavoriteIcon({
    required this.isActive,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme myColors = Theme.of(context).colorScheme;
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        isActive == 1 ? Icons.favorite : Icons.favorite_border_outlined,
        color: myColors.error,
      ),
      iconSize: 20,
    );
  }
}
