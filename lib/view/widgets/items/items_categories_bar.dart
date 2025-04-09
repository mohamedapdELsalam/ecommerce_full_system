import 'package:ecommerceapp/controller/items_controller.dart';
import 'package:ecommerceapp/core/screen_dimensions.dart';
import 'package:ecommerceapp/data/model/categories_model.dart';
import 'package:ecommerceapp/view/widgets/items/items_categories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsCategoriesBar extends StatelessWidget {
  const ItemsCategoriesBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ItemsController controller = Get.put(ItemsController());

    var myColors = Theme.of(context).colorScheme;
    double appWidth = MediaQuery.of(context).size.width;
    double appHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: Responsible.isDesktop(context)
          ? appHeight * 0.25
          : Responsible.isMobile(context)
              ? appHeight * 0.1
              : Responsible.isPortrait(context)
                  ? appHeight * 0.24
                  : appHeight * 0.25,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (context, i) {
          return Container(
            margin: const EdgeInsets.only(right: 15),
            child: CategoriesItemsPage(
                onTap: () {
                  controller.changeCategory(
                      CategoriesModel.fromJson(controller.categories[i])
                          .categoriesId!);
                },
                i: CategoriesModel.fromJson(controller.categories[i])
                    .categoriesId!,
                categoriesModel:
                    CategoriesModel.fromJson(controller.categories[i]),
                appWidth: appWidth,
                appHeight: appHeight,
                myColors: myColors),
          );
        },
      ),
    );
  }
}
