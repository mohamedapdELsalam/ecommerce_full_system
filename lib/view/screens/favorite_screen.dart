import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/controller/favorite_controller.dart';
import 'package:ecommerceapp/core/class/handlind_status_request.dart';
import 'package:ecommerceapp/core/class/status_request.dart';
import 'package:ecommerceapp/core/constants/api_links.dart';
import 'package:ecommerceapp/core/constants/app_routes.dart';
import 'package:ecommerceapp/core/functions/transulateDatabase.dart';
import 'package:ecommerceapp/core/screen_dimensions.dart';
import 'package:ecommerceapp/data/model/items_model.dart';
import 'package:ecommerceapp/view/widgets/favorites/appbar_favorite.dart';
import 'package:ecommerceapp/view/widgets/homepage/appbar/appbar_disktop.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FavoriteController controller = Get.put(FavoriteController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Responsible(
              mobile: AppBarFavorite(controller: controller),
              desktop: AppBardesktop()),
          SizedBox(height: 10),
          GetBuilder<FavoriteController>(
            builder: (controller) => Text(
              controller.statusRequest == StatusRequest.loading
                  ? ""
                  : controller.favoriteProducts.isEmpty
                      ? "no products in favorite"
                      : "my favorite products",
              style: Theme.of(context).textTheme.titleSmall,
              textAlign: TextAlign.center,
            ),
          ),
          GetBuilder<FavoriteController>(
            builder: (controller) => HandlingStatusRequest(
              controller: controller,
              statusRequest: controller.statusRequest,
              widget: Container(
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.favoriteProducts.length,
                  itemBuilder: (context, i) {
                    ItemsModel itemsModel = controller.favoriteProducts[i];
                    return InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.itemDetails, arguments: {
                          "item": itemsModel,
                        });
                      },
                      child: Card(
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      translateDatabase(
                                          itemsModel.itemsNameAr,
                                          itemsModel.itemsNameEn,
                                          itemsModel.itemsNameDe,
                                          itemsModel.itemsNameSp),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onSecondary),
                                    ),
                                    Text(
                                      "${itemsModel.itemsPrice} LE",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .error),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Stack(
                                children: [
                                  Hero(
                                    tag: itemsModel.itemsId!,
                                    child: CachedNetworkImage(
                                        height: 120,
                                        width: 200,
                                        fit: BoxFit.cover,
                                        imageUrl:
                                            "${ApiLinks.itemImageRoot}/${itemsModel.itemsImage}"),
                                  ),
                                  Positioned(
                                      right: 5,
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.delete,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .error,
                                        ),
                                        onPressed: () {
                                          Get.defaultDialog(
                                            title: "warn",
                                            content: Text(
                                              "do you agreed to remove ${itemsModel.itemsNameEn} from favorite",
                                              textAlign: TextAlign.center,
                                            ),
                                            onCancel: () {},
                                            onConfirm: () {
                                              controller
                                                  .deleteFromLocal(itemsModel);

                                              controller.deleteFromFavorite(
                                                  itemsModel.itemsId!,
                                                  itemsModel.itemsNameEn!);
                                              Navigator.pop(context);
                                            },
                                          );
                                        },
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
