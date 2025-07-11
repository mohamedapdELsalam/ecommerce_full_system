import 'package:ecommerceapp/controller/items/items_controller.dart';
import 'package:ecommerceapp/core/extensions/context_extensions.dart';
import 'package:ecommerceapp/core/functions/transulateDatabase.dart';
import 'package:ecommerceapp/core/screen_dimensions.dart';
import 'package:ecommerceapp/data/model/categories_model.dart';
import 'package:ecommerceapp/view/widgets/homepage/categories/categories_listview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesItemsPage extends GetView<ItemsController> {
  const CategoriesItemsPage({
    super.key,
    required this.categoriesModel,
    required this.i,
    required this.onTap,
  });

  final CategoriesModel categoriesModel;
  final void Function()? onTap;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InkWell(
        splashColor: const Color.fromARGB(0, 255, 5, 5),
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                height: Responsible.isDesktop(context)
                    ? context.height * 0.17
                    : Responsible.isMobile(context)
                        ? context.height * 0.06
                        : Responsible.isPortrait(context)
                            ? context.height * 0.15
                            : context.height * 0.1,
                child: AspectRatio(
                    aspectRatio: 1,
                    child: IconCategories(categoriesModel: categoriesModel))),
            Text(
              translateDatabase(
                  categoriesModel.categoriesNameAr!,
                  categoriesModel.categoriesNameEn!,
                  categoriesModel.categoriesNameDe!,
                  categoriesModel.categoriesNameSp!),
              style: TextStyle(
                  color: controller.selectedCateg.value == i
                      ? Colors.green
                      : context.primaryColor),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
