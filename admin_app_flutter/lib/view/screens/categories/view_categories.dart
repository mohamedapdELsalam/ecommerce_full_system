import 'package:adminapp/controller/categories/view_categ_controller.dart';
import 'package:adminapp/core/class/handlind_status_request.dart';
import 'package:adminapp/core/constants/api_links.dart';
import 'package:adminapp/core/constants/app_routes.dart';
import 'package:adminapp/data/model/category_model.dart';
import 'package:adminapp/view/widgets/categories/categories_card.dart';
import 'package:adminapp/view/widgets/homepage/admin_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // CategoriesController controller =
    Get.put(CategoriesController());
    return Scaffold(
      appBar: AppBar(title: Text("Categories")),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          GetBuilder<CategoriesController>(
            builder:
                (controller) => HandlingStatusRequest(
                  statusRequest: controller.statusRequest,
                  widget: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemCount: controller.categories.length + 1,
                    itemBuilder: (context, i) {
                      CategoryModel model;
                      if (i == controller.categories.length) {
                        return AdminCard(
                          title: "Add",
                          image: CircleAvatar(
                            backgroundColor: Colors.black12,
                            child: Icon(Icons.add, color: Colors.black),
                          ),
                          onTap: () async {
                            var result = await Get.toNamed(
                              AppRoutes.addCategory,
                            );
                            if (result == "refresh") {
                              await controller.getCategories();
                            }
                          },
                        );
                      } else {
                        model = controller.categories[i];
                      }
                      return CategoriesCard(
                        onDelete: () {
                          controller.deleteCategory(
                            model.categoriesId!,
                            model.categoriesImage!,
                          );
                        },
                        onCancel: () {},
                        title: model.categoriesNameEn!,
                        image: SvgPicture.network(
                          "${ApiLinks.categoryRoot}/${model.categoriesImage}",
                          height: 50,
                        ),
                        onTap: () async {
                          {
                            var result = await Get.toNamed(
                              AppRoutes.editCategory,
                              arguments: {"model": model},
                            );
                            if (result == "refresh") {
                              controller.getCategories();
                            }
                          }
                        },
                      );
                    },
                  ),
                  controller: controller,
                ),
          ),
        ],
      ),
    );
  }
}
