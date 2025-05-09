import 'dart:io';
import 'package:adminapp/core/class/status_request.dart';
import 'package:adminapp/core/functions/handling_status_request.dart';
import 'package:adminapp/core/functions/upload_image.dart';
import 'package:adminapp/data/data_source/remote/categories/add_categ.data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

abstract class AddCategoryControllerAbstract extends GetxController {
  TextEditingController nameArCtrl = TextEditingController();
  TextEditingController nameEnCtrl = TextEditingController();
  TextEditingController nameDeCtrl = TextEditingController();
  TextEditingController nameSpCtrl = TextEditingController();
  StatusRequest statusRequest = StatusRequest.none;
  AddCategoryData addCategoryData = AddCategoryData();
  ImagePicker image = ImagePicker();
  File? categImage;
  Future<void> addCategory();
}

class AddCategoryController extends AddCategoryControllerAbstract {
  @override
  void onInit() async {
    super.onInit();
  }

  pickCategImage() async {
    categImage = await uploadImage(allowExt: ["svg"]);

    update();
  }

  @override
  addCategory() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addCategoryData.addCategory(
      image: File(categImage!.path),
      nameAr: nameArCtrl.text,
      nameEn: nameEnCtrl.text,
      nameDe: nameDeCtrl.text,
      nameSp: nameSpCtrl.text,
    );
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        // Get.offNamed(AppRoutes.categories);
        Get.back(result: "refresh");
        Get.snackbar("done", "category added successfully");
      } else {
        Get.defaultDialog(title: "fail");
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
