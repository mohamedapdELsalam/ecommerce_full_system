import 'dart:io';

import 'package:adminapp/core/class/status_request.dart';
import 'package:adminapp/core/functions/handling_status_request.dart';
import 'package:adminapp/core/functions/upload_image.dart';
import 'package:adminapp/data/data_source/remote/items/add_item_data.dart';
import 'package:adminapp/data/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

abstract class AddItemControllerAbstract extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController nameArCtrl = TextEditingController();
  TextEditingController nameEnCtrl = TextEditingController();
  TextEditingController nameDeCtrl = TextEditingController();
  TextEditingController nameSpCtrl = TextEditingController();
  TextEditingController descArCtrl = TextEditingController();
  TextEditingController descEnCtrl = TextEditingController();
  TextEditingController descDeCtrl = TextEditingController();
  TextEditingController descSpCtrl = TextEditingController();
  TextEditingController priceCtrl = TextEditingController();
  TextEditingController discountCtrl = TextEditingController();
  TextEditingController quantityCtrl = TextEditingController();

  StatusRequest statusRequest = StatusRequest.none;
  AddItemData addProductData = AddItemData();
  ImagePicker image = ImagePicker();
  List<CategoryModel> categories = [];
  File? productImage;
  bool isActive = true;
  int? selectedCategory;

  Future<void> addItem();
  Future<void> pickImage();
  Future<void> getCategories();
}

class AddItemController extends AddItemControllerAbstract {
  @override
  void onInit() async {
    super.onInit();
    await getCategories();
  }

  @override
  void onClose() {
    super.onClose();
    nameArCtrl.dispose();
    nameEnCtrl.dispose();
    nameDeCtrl.dispose();
    nameSpCtrl.dispose();
    descArCtrl.dispose();
    descEnCtrl.dispose();
    descDeCtrl.dispose();
    descSpCtrl.dispose();
    priceCtrl.dispose();
    discountCtrl.dispose();
    quantityCtrl.dispose();
  }

  @override
  pickImage() async {
    productImage = await uploadImage(
      allowExt: ["jpg", "heic", "kd", "dkd", "kdjls", "dkj"],
    );
    update();
  }

  @override
  addItem() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      if (productImage == null) {
        return Get.defaultDialog(
          title: "warning",
          content: Text("you must add product photo"),
        );
      }
      statusRequest = StatusRequest.loading;
      update();
      var response = await addProductData.addItem(
        active: isActive ? "1" : "0",
        count: quantityCtrl.text,
        nameAr: nameArCtrl.text,
        nameEn: nameEnCtrl.text,
        nameDe: nameDeCtrl.text,
        nameSp: nameSpCtrl.text,
        descAr: descArCtrl.text,
        descEn: descEnCtrl.text,
        descDe: descDeCtrl.text,
        descSp: descSpCtrl.text,
        discount: discountCtrl.text,
        price: priceCtrl.text,
        categoryId: selectedCategory.toString(),
        image: File(productImage!.path),
      );

      statusRequest = handlingStatusRequest(response);
      if (statusRequest == StatusRequest.success) {
        if (response["status"] == "success") {
          Get.back(result: "refresh");
          Get.snackbar("done", "product added successfully");
        } else {
          Get.snackbar("fail", "product doesn't add successfully");
        }
      } else {
        Get.snackbar("fail", "Error 404");
      }
      update();
    }
  }

  @override
  getCategories() async {
    statusRequest = StatusRequest.loading;
    // update();
    var response = await addProductData.getCategories();
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        List data = response["data"];
        categories.addAll(data.map((e) => CategoryModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      print("error 404 hahaha");
    }
    update();
  }
}
