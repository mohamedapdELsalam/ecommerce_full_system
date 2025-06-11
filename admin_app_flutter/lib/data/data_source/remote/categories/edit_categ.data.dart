import 'dart:io';

import 'package:adminapp/core/class/crud.dart';
import 'package:adminapp/core/constants/api_links.dart';

class EditCategoryData {
  Crud crud = Crud();

  editCategory({
    int? categId,
    String? nameAr,
    String? nameEn,
    String? nameDe,
    String? nameSp,
    String? imageName,
    File? image,
  }) async {
    print("---------------------------  can you see me  ? -----------------");
    print("categId : $categId  \n nameAr : $nameAr \n imageName : $imageName");
    if (image != null) {
      var response = await crud.postRequestWithFile(ApiLinks.editCategory, {
        "id": categId.toString(),
        "nameAr": nameAr,
        "nameEn": nameEn,
        "nameDe": nameDe,
        "nameSp": nameSp,
        "imageName": imageName,
      }, image);
      if (response.isRight()) {
        return response.fold((l) => null, (r) => r);
      } else {
        return response.fold((l) => l, (r) => null);
      }
    } else {
      var response = await crud.postRequest(ApiLinks.editCategory, {
        "id": categId.toString(),
        "nameAr": nameAr,
        "nameEn": nameEn,
        "nameDe": nameDe,
        "nameSp": nameSp,
        "imageName": imageName,
      });
      if (response.isRight()) {
        return response.fold((l) => null, (r) => r);
      } else {
        return response.fold((l) => l, (r) => null);
      }
    }
  }
}
