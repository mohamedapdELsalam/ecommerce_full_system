import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/controller/favorite_controller.dart';
import 'package:ecommerceapp/controller/items/items_controller.dart';
import 'package:ecommerceapp/core/constants/api_links.dart';
import 'package:ecommerceapp/core/constants/image_assets.dart';
import 'package:ecommerceapp/core/functions/transulateDatabase.dart';
import 'package:ecommerceapp/core/screen_dimensions.dart';
import 'package:ecommerceapp/data/model/items_model.dart';
import 'package:ecommerceapp/view/widgets/homepage/most_sell_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProductsGridView extends GetView<ItemsController> {
  const ProductsGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    FavoriteController favController = Get.put(FavoriteController());

    ColorScheme myColors = Theme.of(context).colorScheme;
    double appWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height:
          controller.items.length > 1 ? controller.items.length * 150.6 : 400,
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
          var itemModel = controller.items[i];
          favController.isFavorite[itemModel.itemsId] = itemModel.favorite;
          return SizedBox(
            child: InkWell(
              onTap: () async {
                await controller.openItemDetail((itemModel));
                favController.update();
              },
              child: Card(
                color: myColors.onPrimary.withAlpha(200),
                child: MostSellItems(itemModel: itemModel, myColors: myColors),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Items extends StatelessWidget {
  const Items({
    super.key,
    required this.myColors,
    required this.itemModel,
  });
  final ItemsModel itemModel;
  final ColorScheme myColors;

  @override
  Widget build(BuildContext context) {
    double imageHeight = MediaQuery.of(context).size.height;

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
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(5),
                    ),
                    child: Hero(
                      transitionOnUserGestures: true,
                      placeholderBuilder: (context, heroSize, child) {
                        return SizedBox(
                          width: heroSize.width,
                          height: heroSize.height,
                          child: Center(child: CircularProgressIndicator()),
                        );
                      },
                      flightShuttleBuilder:
                          (context, animation, direction, from, to) {
                        return ScaleTransition(
                          scale: Tween<double>(begin: 0.95, end: 1.0).animate(
                            CurvedAnimation(
                                parent: animation, curve: Curves.easeInOut),
                          ),
                          child: FadeTransition(
                            opacity: animation,
                            child: to.widget,
                          ),
                        );
                      },
                      tag: itemModel.itemsId!,
                      child: CachedNetworkImage(
                        imageUrl:
                            "${ApiLinks.itemImageRoot}/${itemModel.itemsImage}",
                        height: Responsible.isDesktop(context)
                            ? imageHeight * 0.4
                            : Responsible.isMobile(context)
                                ? imageHeight * 0.2
                                : Responsible.isPortrait(context)
                                    ? imageHeight * 0.5
                                    : imageHeight * 0.3,
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
            subtitle: Text(
              "${itemModel.itemsPrice} LE",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.red[700]),
            ),
          ),
        )
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
