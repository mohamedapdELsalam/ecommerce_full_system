import 'dart:io';

import 'package:adminapp/core/class/status_request.dart';
import 'package:adminapp/core/functions/handling_status_request.dart';
import 'package:adminapp/data/data_source/remote/products/add_product_data.dart';
import 'package:adminapp/data/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

abstract class AddProductControllerAbstract extends GetxController {
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
  AddProductData addProductData = AddProductData();
  ImagePicker image = ImagePicker();
  List<CategoryModel> categories = [];
  XFile? productImage;
  bool isActive = true;
  int? selectedCategory;

  Future<void> addProduct();
  Future<void> pickImage();
  Future<void> getCategories();
}

class AddProductController extends AddProductControllerAbstract {
  GlobalKey<FormState> myGlobalKey = GlobalKey();

  @override
  void onInit() async {
    super.onInit();
    await getCategories();
  }

  @override
  pickImage() async {
    productImage = await image.pickImage(source: ImageSource.gallery);
    update();
  }

  @override
  addProduct() async {
    if (myGlobalKey.currentState!.validate()) {
      myGlobalKey.currentState!.save();
      statusRequest = StatusRequest.loading;
      update();
      var response = await addProductData.addProduct(
        active: isActive.toString(),
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
