import 'package:ecommerceapp/controller/homepage_controller.dart';
import 'package:ecommerceapp/core/constants/api_links.dart';
import 'package:ecommerceapp/core/extensions/context_extensions.dart';
import 'package:ecommerceapp/core/functions/transulateDatabase.dart';
import 'package:ecommerceapp/core/screen_dimensions.dart';
import 'package:ecommerceapp/data/model/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CategoriesListView extends GetView<HomePageController> {
  const CategoriesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Responsible.isDesktop(context)
          ? context.height * 0.25
          : Responsible.isMobile(context)
              ? context.height * 0.1
              : Responsible.isPortrait(context)
                  ? context.height * 0.24
                  : context.height * 0.15,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (context, i) {
          // int id =
          //     CategoriesModel.fromJson(controller.categories[i]).categoriesId!;

          return Container(
            margin: EdgeInsets.only(right: 15),
            child: CategoryItem(
                onTap: () {
                  controller.gotoItems(
                    CategoriesModel.fromJson(controller.categories[i])
                        .categoriesId!,
                  );
                },
                categoriesModel:
                    CategoriesModel.fromJson(controller.categories[i])),
          );
        },
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.categoriesModel,
    required this.onTap,
  });

  final CategoriesModel categoriesModel;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            child: InkWell(
              onTap: onTap,
              child: IconCategories(categoriesModel: categoriesModel),
            ),
          ),
        ),
        Text(
          translateDatabase(
              categoriesModel.categoriesNameAr!,
              categoriesModel.categoriesNameEn!,
              categoriesModel.categoriesNameDe!,
              categoriesModel.categoriesNameSp!),
          textAlign: TextAlign.center,
          style: TextStyle(color: context.onSecondary),
        ),
      ],
    );
  }
}

class IconCategories extends StatelessWidget {
  const IconCategories({
    super.key,
    required this.categoriesModel,
  });

  final CategoriesModel categoriesModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: context.onPrimaryColor,
          borderRadius: BorderRadius.all(Radius.circular(200))),
      child: SvgPicture.network(
        "${ApiLinks.categoryRoot}/${categoriesModel.categoriesImage}",
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
