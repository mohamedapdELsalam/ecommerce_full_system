import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/controller/favorite_controller.dart';
import 'package:ecommerceapp/controller/homepage_controller.dart';
import 'package:ecommerceapp/core/constants/api_links.dart';
import 'package:ecommerceapp/core/constants/image_assets.dart';
import 'package:ecommerceapp/core/functions/transulateDatabase.dart';
import 'package:ecommerceapp/core/screen_dimensions.dart';
import 'package:ecommerceapp/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MostSellProducts extends GetView<HomePageController> {
  const MostSellProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    FavoriteController favController = Get.put(FavoriteController());

    ColorScheme myColors = Theme.of(context).colorScheme;
    double appWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: controller.topSelling.length * 150.6,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            crossAxisCount: appWidth >= 1200
                ? 5
                : appWidth >= 900
                    ? 4
                    : appWidth >= 700
                        ? 3
                        : 2,
            childAspectRatio: 2 / 3),
        itemCount: controller.topSelling.length,
        itemBuilder: (BuildContext context, int i) {
          var itemModel = controller.topSelling[i];
          favController.isFavorite[itemModel.itemsId] = itemModel.favorite;
          return SizedBox(
            child: InkWell(
              onTap: () async {
                await controller.openItemDetail((itemModel));
                favController.update();
              },
              child: Card(
                color: myColors.surface,
                child: MostSellItems(itemModel: itemModel, myColors: myColors),
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
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: SizedBox(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  right: 0,
                  left: 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(5),
                    ),
                    child: Hero(
                      transitionOnUserGestures: true,
                      tag: itemModel.itemsId!,
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
                ),
                Positioned(
                  right: 5,
                  top: 5,
                  child: FinalFavoriteIcon(itemModel: itemModel),
                ),
                if (itemModel.itemsDiscount! > 0)
                  Positioned(
                    left: -5,
                    top: -7,
                    child: SvgPicture.asset(
                      SvgAssets.saleRed,
                      height: 40,
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
              textAlign: TextAlign.start,
              translateDatabase(
                itemModel.itemsNameAr!,
                itemModel.itemsNameEn!,
                itemModel.itemsNameDe!,
                itemModel.itemsNameSp!,
              ),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            subtitle: Wrap(
              children: [
                FittedBox(
                  child: Text(
                    "${itemModel.finalPrice} LE ",
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.red[700]),
                  ),
                ),
                FittedBox(
                  child: Text(
                    " ${itemModel.itemsPrice}",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        decoration: TextDecoration.lineThrough,
                        color: const Color.fromARGB(255, 143, 140, 140)),
                  ),
                ),
              ],
            ),
          ),
        ),
        // Text(
        //   " sold${itemModel.countItems} ",
        //   style: Theme.of(context)
        //       .textTheme
        //       .bodyMedium!
        //       .copyWith(color: const Color.fromARGB(255, 143, 140, 140)),
        // ),
      ],
    );
  }
}

class FinalFavoriteIcon extends StatelessWidget {
  const FinalFavoriteIcon({
    super.key,
    required this.itemModel,
  });

  final ItemsModel itemModel;

  @override
  Widget build(BuildContext context) {
    ColorScheme myColors = Theme.of(context).colorScheme;

    return GetBuilder<FavoriteController>(
      builder: (controller) => IconButton(
        onPressed: () {
          if (controller.isFavorite[itemModel.itemsId] == 0) {
            itemModel.favorite = 1;
            controller.setFavorite(itemModel.itemsId, 1);
            controller.addToFavorite(
                itemModel.itemsId!,
                translateDatabase(
                    itemModel.itemsNameAr!,
                    itemModel.itemsNameEn!,
                    itemModel.itemsNameDe!,
                    itemModel.itemsNameSp!));
            controller.favoriteProducts.add(itemModel);
          } else {
            itemModel.favorite = 0;
            controller.setFavorite(itemModel.itemsId, 0);
            controller.deleteFromFavorite(
                itemModel.itemsId!,
                translateDatabase(
                    itemModel.itemsNameAr!,
                    itemModel.itemsNameEn!,
                    itemModel.itemsNameDe!,
                    itemModel.itemsNameSp!));
            controller.deleteFromLocal(itemModel);
          }
        },
        icon: Icon(
          controller.isFavorite[itemModel.itemsId] == 0
              ? Icons.favorite_border_outlined
              : Icons.favorite,
          color: myColors.error,
        ),
        iconSize: 20,
      ),
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
