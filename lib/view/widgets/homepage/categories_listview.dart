import 'package:ecommerceapp/controller/homepage_controller.dart';
import 'package:ecommerceapp/core/constants/apiLink.dart';
import 'package:ecommerceapp/data/model/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CategroiesListView extends GetView<HomePageController> {
  const CategroiesListView({
    super.key,
    required this.appWidth,
    required this.appHeight,
    required this.myColors,
  });

  final double appWidth;
  final double appHeight;
  final ColorScheme myColors;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: appWidth < 1200 ? appHeight * 0.08 : appHeight * 0.16,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (context, i) {
          return Container(
            margin: EdgeInsets.only(right: 15),
            child: Categories(
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

class Categories extends StatelessWidget {
  const Categories({
    super.key,
    required this.appWidth,
    required this.appHeight,
    required this.controller,
    required this.myColors,
    required this.categoriesModel,
  });

  final double appWidth;
  final double appHeight;
  final HomePageController controller;
  final ColorScheme myColors;
  final CategoriesModel categoriesModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: appWidth < 1200 ? appHeight * 0.05 : appHeight * 0.08,
          child: AspectRatio(
            aspectRatio: 1,
            child: InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(85, 177, 212, 232),
                    borderRadius: BorderRadius.all(Radius.circular(200))),
                child: SvgPicture.network(
                  "${ApiLinks.categoryRoot}/${categoriesModel.categoriesImage}",
                  color: myColors.primary,
                ),
              ),
            ),
          ),
        ),
        Text(
          Get.locale!.languageCode == "en"
              ? "${categoriesModel.categoriesNameEn}"
              : Get.locale!.languageCode == "ar"
                  ? "${categoriesModel.categoriesNameAr}"
                  : Get.locale!.languageCode == "de"
                      ? "${categoriesModel.categoriesNameDe}"
                      : "${categoriesModel.categoriesNameSp}",
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
