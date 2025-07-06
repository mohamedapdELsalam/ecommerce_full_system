import 'dart:convert';
import 'dart:io';

import 'package:adminapp/core/class/crud.dart';
import 'package:adminapp/core/constants/api_links.dart';

class EditItemData {
  Crud crud = Crud();

  editItem({
    int? itemId,
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
    String? imageName,
    File? image,
    List? newVariants,
    List? editedVariants,
    List? deletedVariants,
  }) async {
    if (image != null) {
      var response = await crud.postRequestWithFile(ApiLinks.updateAll, {
        "itemId": itemId.toString(),
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
        "imageName": imageName,
        "categoryId": categoryId,
        "newVariants": jsonEncode(newVariants),
        "editedVariants": jsonEncode(editedVariants),
        "deletedVariants": jsonEncode(deletedVariants),
      }, image);
      if (response.isRight()) {
        return response.fold((l) => null, (r) => r);
      } else {
        return response.fold((l) => l, (r) => null);
      }
    } else {
      var response = await crud.postRequest(ApiLinks.updateAll, {
        "itemId": itemId.toString(),
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
        "imageName": imageName,
        "newVariants": jsonEncode(newVariants),
        "editedVariants": jsonEncode(editedVariants),
        "deletedVariants": jsonEncode(deletedVariants),
      });
      if (response.isRight()) {
        return response.fold((l) => null, (r) => r);
      } else {
        return response.fold((l) => l, (r) => null);
      }
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

  getProcutVariants(int itemId) async {
    var response = await crud.postRequest(ApiLinks.viewProductVariants, {
      "itemId": itemId.toString(),
    });
    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }

  deleteVariants(List variantIds) async {
    var response = await crud.postRequest(ApiLinks.deleteVariant, {
      "variantId": jsonEncode(variantIds),
    });
    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }

  editVariant(List<Map> variantIds) async {
    var response = await crud.postRequest(ApiLinks.editVariant, {
      "editedIds": jsonEncode(variantIds),
    });
    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }
}
