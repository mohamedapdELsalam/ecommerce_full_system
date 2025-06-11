import 'package:adminapp/core/class/crud.dart';
import 'package:adminapp/core/constants/api_links.dart';
import 'package:adminapp/core/services/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

class CategoriesViewData {
  Crud crud = Crud();
  MyServices myServices = Get.find();

  getCategories() async {
    var response = await crud.getRequest(ApiLinks.categoriesView);
    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }
  deleteCategory(int categoryId , String imageName) async {
    var response = await crud.postRequest(ApiLinks.deleteCategory,{
      "id":categoryId.toString(),
      "imageName":imageName,
    });
    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }
}
