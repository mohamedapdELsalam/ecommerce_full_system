import 'package:adminapp/controller/products/view_product_controller.dart';
import 'package:adminapp/core/constants/api_links.dart';
import 'package:adminapp/core/constants/app_routes.dart';
import 'package:adminapp/core/constants/image_assets.dart';
import 'package:adminapp/core/functions/transulateDatabase.dart';
import 'package:adminapp/core/screen_dimensions.dart';
import 'package:adminapp/data/model/product_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProductsGridView extends GetView<ProductsViewController> {
  const ProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme myColors = Theme.of(context).colorScheme;
    double appWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height:
          controller.products.length > 1
              ? controller.products.length * 150.6
              : 400,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          crossAxisCount:
              appWidth >= 1200
                  ? 5
                  : appWidth >= 900
                  ? 4
                  : appWidth >= 700
                  ? 3
                  : 2,
          childAspectRatio: 2 / 3,
        ),
        itemCount: controller.products.length,
        itemBuilder: (BuildContext context, int i) {
          var productModel = controller.products[i];
          return SizedBox(
            child: InkWell(
              onTap: () async {
                // await controller.openItemDetail((itemModel));
                var result = await Get.toNamed(
                  AppRoutes.editProducts,
                  arguments: {"model": productModel},
                );

                if (result == "refresh") {
                  await controller.getProducts();
                }
              },
              child: Card(
                color: myColors.onPrimary.withAlpha(200),
                child: Items(productModel: productModel, myColors: myColors),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Items extends StatelessWidget {
  const Items({super.key, required this.myColors, required this.productModel});
  final ProductModel productModel;
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
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(5),
                    ),
                    child: Image.network(
                      
                      "${ApiLinks.itemImageRoot}/${productModel.itemsImage!}",
                      height:
                          Responsible.isDesktop(context)
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

                if (productModel.itemsDiscount! > 0)
                  Positioned(
                    left: -5,
                    top: -7,
                    child: SvgPicture.asset(SvgAssets.saleRed, height: 40),
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
                productModel.itemsNameAr,
                productModel.itemsNameEn,
                productModel.itemsNameDe,
                productModel.itemsNameSp,
              ),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            subtitle: Text(
              "${productModel.itemsPrice} LE",
              style: Theme.of(
                context,
              ).textTheme.bodySmall!.copyWith(color: Colors.red[700]),
            ),
          ),
        ),
      ],
    );
  }
}
