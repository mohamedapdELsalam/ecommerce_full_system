import 'package:ecommerceapp/controller/homepage_controller.dart';
import 'package:ecommerceapp/core/constants/apiLink.dart';
import 'package:ecommerceapp/core/functions/transulateDatabase.dart';
import 'package:ecommerceapp/core/screen_dimensions.dart';
import 'package:ecommerceapp/data/model/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CategroiesListView extends GetView<HomePageController> {
  const CategroiesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme myColors = Theme.of(context).colorScheme;
    double appHeight = MediaQuery.of(context).size.height;
    double appWidth = MediaQuery.of(context).size.width;
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
          // int id =
          //     CategoriesModel.fromJson(controller.categories[i]).categoriesId!;

          return Container(
            margin: EdgeInsets.only(right: 15),
            child: CategoriesHomepage(
                ontap: () {
                  controller.gotoItems(
                    CategoriesModel.fromJson(controller.categories[i])
                        .categoriesId!,
                  );
                },
                i: i,
                categoriesModel:
                    CategoriesModel.fromJson(controller.categories[i]),
                appWidth: appWidth,
                appHeight: appHeight,
                controller: controller,
                myColors: myColors),
          );
        },
      ),
    );
  }
}

class CategoriesHomepage extends StatelessWidget {
  const CategoriesHomepage({
    super.key,
    required this.appWidth,
    required this.appHeight,
    required this.controller,
    required this.myColors,
    required this.categoriesModel,
    required this.i,
    required this.ontap,
  });

  final double appWidth;
  final double appHeight;
  final controller;
  final ColorScheme myColors;
  final CategoriesModel categoriesModel;
  final void Function()? ontap;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: Responsible.isDesktop(context)
              ? appHeight * 0.17
              : Responsible.isMobile(context)
                  ? appHeight * 0.06
                  : Responsible.isPortrait(context)
                      ? appHeight * 0.15
                      : appHeight * 0.25,
          child: AspectRatio(
            aspectRatio: 1,
            child: InkWell(
              onTap: ontap,
              child: IconCategories(categoriesModel: categoriesModel),
            ),
          ),
        ),
        Text(
          translateDatabase(
              categoriesModel.categoriesNameAr,
              categoriesModel.categoriesNameEn,
              categoriesModel.categoriesNameDe,
              categoriesModel.categoriesNameSp),
          textAlign: TextAlign.center,
          style: TextStyle(color: myColors.onSecondary),
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
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.all(Radius.circular(200))),
      child: SvgPicture.network(
        "${ApiLinks.categoryRoot}/${categoriesModel.categoriesImage}",
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
