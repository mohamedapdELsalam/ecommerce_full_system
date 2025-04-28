import 'dart:io';

import 'package:adminapp/core/class/crud.dart';
import 'package:adminapp/core/constants/api_links.dart';
import 'package:adminapp/core/services/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

class AddCategoryData {
  Crud crud = Crud();
  MyServices myServices = Get.find();

  addCategory({
    String? nameAr,
    String? nameEn,
    String? nameDe,
    String? nameSp,
    File? image,
  }) async {
    var response = await crud.postRequestWithFile(ApiLinks.addCategory, {
      "nameAr": nameAr,
      "nameEn": nameEn,
      "nameDe": nameDe,
      "nameSp": nameSp,
    }, image!);
    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }
}
