import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/controller/favorite_controller.dart';
import 'package:ecommerceapp/controller/offer_controller.dart';
import 'package:ecommerceapp/core/constants/apiLink.dart';
import 'package:ecommerceapp/core/constants/image_assets.dart';
import 'package:ecommerceapp/core/functions/transulateDatabase.dart';
import 'package:ecommerceapp/core/screen_dimensions.dart';
import 'package:ecommerceapp/data/model/items_model.dart';
import 'package:ecommerceapp/view/widgets/items/products_gridview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class OffersItemsGridView extends GetView<OffersController> {
  const OffersItemsGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    FavoriteController favController = Get.put(FavoriteController());
    ColorScheme myColors = Theme.of(context).colorScheme;
    double appWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6),
      height: controller.offersItems.length > 1
          ? controller.offersItems.length * 150.6
          : 400,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 20,
            crossAxisSpacing: 10,
            crossAxisCount: appWidth >= 1200
                ? 5
                : appWidth >= 900
                    ? 4
                    : appWidth >= 700
                        ? 3
                        : 2,
            childAspectRatio: 2 / 3),
        itemCount: controller.offersItems.length,
        itemBuilder: (BuildContext context, int i) {
          var itemModel = controller.offersItems[i];
          favController.isFavorite[itemModel.itemsId] = itemModel.favorite;
          return SizedBox(
            child: InkWell(
              onTap: () async {
                await controller.openItemDetail((itemModel));
                favController.update();
              },
              child: Card(
                color: myColors.onPrimary.withAlpha(200),
                child: OfferItems(itemModel: itemModel, myColors: myColors),
              ),
            ),
          );
        },
      ),
    );
  }
}

class OfferItems extends StatelessWidget {
  const OfferItems({
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
                itemModel.itemsNameAr,
                itemModel.itemsNameEn,
                itemModel.itemsNameDe,
                itemModel.itemsNameSp,
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
      ],
    );
  }
}
