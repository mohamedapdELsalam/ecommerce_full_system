import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/controller/item_details_controller.dart';
import 'package:ecommerceapp/controller/items_controller.dart';
import 'package:ecommerceapp/core/constants/apiLink.dart';
import 'package:ecommerceapp/core/functions/transulateDatabase.dart';
import 'package:ecommerceapp/core/screen_dimensions.dart';
import 'package:ecommerceapp/view/widgets/homepage/most_sell_products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class itemDetails extends StatelessWidget {
  const itemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsDetailsController controller = Get.put(ItemsDetailsController());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
        child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  WidgetStatePropertyAll(Theme.of(context).colorScheme.primary),
            ),
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 13),
              child: Text(
                "Add To Cart",
                style: TextStyle(color: Theme.of(context).colorScheme.surface),
              ),
            )),
      ),
      body: Container(
        child: ListView(
          // shrinkWrap: true,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    // height:
                    //     size.width >= 1200 ? size.height * 0.15 : size.height * 0.3,
                    height: 600,
                    child: Stack(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(40)),
                        )),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: SizedBox(
                                width: double.infinity,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                      bottom: Radius.circular(5)),
                                  child: Hero(
                                    tag: "${controller.item.itemsId}",
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          "${ApiLinks.itemImageRoot}/${controller.item.itemsImage}",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      translateDatabase(
                                          controller.item.itemsNameAr,
                                          controller.item.itemsNameEn,
                                          controller.item.itemsNameDe,
                                          controller.item.itemsNameSp),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineLarge!
                                          .copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary),
                                      textAlign: TextAlign.start,
                                    ),
                                    Text(
                                        translateDatabase(
                                            controller.item.itemsDescAr,
                                            controller.item.itemsDescEn,
                                            controller.item.itemsDescDe,
                                            controller.item.itemsDescSp),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSurface
                                                    .withAlpha(200))),
                                    Container(
                                      padding: EdgeInsets.only(top: 20),
                                      child: Row(children: [
                                        Text(
                                          "${controller.item.itemsPrice}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium!
                                              .copyWith(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .secondary),
                                        ),
                                        Text(
                                          " LE ".tr,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium!
                                              .copyWith(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .secondary),
                                        ),
                                        Spacer(),
                                        // ElevatedButton(
                                        //     style: ButtonStyle(
                                        //         backgroundColor:
                                        //             WidgetStatePropertyAll(
                                        //                 Theme.of(context)
                                        //                     .colorScheme
                                        //                     .secondary)),
                                        //     onPressed: () {},
                                        //     child: Text("Add To Cart",
                                        //         style: Theme.of(context)
                                        //             .textTheme
                                        //             .titleSmall!
                                        //             .copyWith(
                                        //                 color: Theme.of(context)
                                        //                     .colorScheme
                                        //                     .primary)))
                                      ]),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        GetBuilder<ItemsController>(
                            builder: (controller) => FavoriteIcon(controller))
                      ],
                    ),
                  ),
                ),
                if (!Responsible.isMobile(context))
                  Expanded(
                    flex: 3,
                    child: Container(
                      width: 500,
                      color: Colors.white,
                    ),
                  ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: 0),
                      child: Text("Color",
                          textAlign: TextAlign.start,
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondary))),
                  Container(
                    padding: EdgeInsets.only(top: 5),
                    child: Row(
                      children: [
                        ProductColorCircle(color: Colors.red),
                        ProductColorCircle(color: Colors.yellow),
                        ProductColorCircle(color: Colors.blue),
                        ProductColorCircle(color: Colors.grey),
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 0),
                      child: Text("Size",
                          textAlign: TextAlign.start,
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondary))),
                  Container(
                    padding: EdgeInsets.only(top: 5),
                    child: Row(
                      children: [
                        ProductSize(size: "s"),
                        ProductSize(size: "m"),
                        ProductSize(size: "l"),
                        ProductSize(size: "xl"),
                        ProductSize(size: "xxl"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductColorCircle extends StatelessWidget {
  final Color color;
  const ProductColorCircle({
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(bottom: 10, right: 10),
        height: 30,
        width: 30,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(blurRadius: 1),
        ], color: color, borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );
  }
}

class ProductSize extends StatelessWidget {
  final String size;
  const ProductSize({
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(bottom: 10, right: 10),
        height: 30,
        width: 30,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(blurRadius: 1),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Center(
            child: Text(
          size,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Colors.blue),
        )),
      ),
    );
  }
}
