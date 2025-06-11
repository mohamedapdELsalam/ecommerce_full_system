import 'dart:io';

import 'package:adminapp/core/class/crud.dart';
import 'package:adminapp/core/constants/api_links.dart';
import 'package:adminapp/core/services/services.dart';
import 'package:get/get.dart';

class AddItemData {
  Crud crud = Crud();
  MyServices myServices = Get.find();

  addItem({
    String? nameAr,
    String? nameEn,
    String? nameDe,
    String? nameSp,
    String? descAr,
    String? descEn,
    String? descDe,
    String? descSp,
    String? price,
    String? discount,
    String? count,
    String? active,
    String? categoryId,
    File? image,
  }) async {
    var response = await crud.postRequestWithFile(ApiLinks.addProduct, {
      "nameAr": nameAr,
      "nameEn": nameEn,
      "nameDe": nameDe,
      "nameSp": nameSp,
      "descAr": descAr,
      "descEn": descEn,
      "descDe": descDe,
      "descSp": descSp,
      "price": price,
      "discount": discount,
      "count": count,
      "active": active,
      "categoryId": categoryId,
    }, image!);
    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }

  getCategories() async {
    var response = await crud.getRequest(ApiLinks.categoriesView);
    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }
}
