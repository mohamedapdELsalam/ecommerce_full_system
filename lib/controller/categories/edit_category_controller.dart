import 'dart:io';

import 'package:adminapp/core/class/status_request.dart';
import 'package:adminapp/core/constants/api_links.dart';
import 'package:adminapp/core/functions/handling_status_request.dart';
import 'package:adminapp/core/functions/upload_image.dart';
import 'package:adminapp/data/data_source/remote/categories/edit_categ.data.dart';
import 'package:adminapp/data/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

abstract class EditCategoryControllerAbstract extends GetxController {
  GlobalKey<FormState> myGlobalKey = GlobalKey();
  TextEditingController nameArCtrl = TextEditingController();
  TextEditingController nameEnCtrl = TextEditingController();
  TextEditingController nameDeCtrl = TextEditingController();
  TextEditingController nameSpCtrl = TextEditingController();
  CategoryModel? category;
  StatusRequest statusRequest = StatusRequest.none;
  EditCategoryData editCategoryData = EditCategoryData();
  ImagePicker image = ImagePicker();
  File? categImage;
  File? localImage;
  Future<void> editCategory();
}

class EditCategoryController extends EditCategoryControllerAbstract {
  @override
  void onInit() async {
    super.onInit();
    category = Get.arguments["model"];
    nameArCtrl.text = category!.categoriesNameAr ?? "";
    nameEnCtrl.text = category!.categoriesNameEn ?? "";
    nameDeCtrl.text = category!.categoriesNameDe ?? "";
    nameSpCtrl.text = category!.categoriesNameSp ?? "";
    categImage = File("${ApiLinks.categoryRoot}/${category!.categoriesImage!}");
  }

  pickCategImage() async {
    localImage = await uploadImage(allowExt: ["svg"]);
    update();
  }

  @override
  editCategory() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await editCategoryData.editCategory(
      image: localImage != null ? File(localImage!.path) : null,
      nameAr: nameArCtrl.text,
      nameEn: nameEnCtrl.text,
      nameDe: nameDeCtrl.text,
      nameSp: nameSpCtrl.text,
      imageName: category!.categoriesImage,
      categId: category!.categoriesId,
    );
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        // Get.offNamed(AppRoutes.categories);
        Get.back(result: "refresh");
        Get.snackbar("Saved", "category Edited successfully");
      } else {
        Get.defaultDialog(title: "fail", middleText: "error");
        statusRequest = StatusRequest.failure;
      }
    } else {
      Get.defaultDialog(title: "very very fail");
      statusRequest = StatusRequest.serverFailure;
    }
    update();
  }

  void resetStatus() {
    statusRequest = StatusRequest.none;
    update();
  }
}
