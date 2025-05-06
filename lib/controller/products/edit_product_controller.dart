import 'dart:io';

import 'package:adminapp/core/class/status_request.dart';
import 'package:adminapp/core/constants/api_links.dart';
import 'package:adminapp/core/functions/handling_status_request.dart';
import 'package:adminapp/data/data_source/remote/products/edit_product_data.dart';
import 'package:adminapp/data/model/category_model.dart';
import 'package:adminapp/data/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

abstract class EditProductControllerAbstract extends GetxController {
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
  ProductModel? product;
  bool? isActive;
  List<CategoryModel> categories = [];
  int? selectedCategory;

  StatusRequest statusRequest = StatusRequest.none;
  EditProductData editProductData = EditProductData();
  ImagePicker image = ImagePicker();
  File? productImage;
  XFile? localImage;
  Future<void> editProduct();
  Future<void> getCategories();
}

class EditProductController extends EditProductControllerAbstract {
  GlobalKey<FormState> myGlobalKey = GlobalKey();

  @override
  void onInit() async {
    super.onInit();
    product = Get.arguments["model"];
    print("--------------------- yossef -------------------");
    print(product);
    nameArCtrl.text = product!.itemsNameAr ?? "";
    nameEnCtrl.text = product!.itemsNameEn ?? "";
    nameDeCtrl.text = product!.itemsNameDe ?? "";
    nameSpCtrl.text = product!.itemsNameSp ?? "";
    descArCtrl.text = product!.itemsDescAr ?? "";
    descEnCtrl.text = product!.itemsDescEn ?? "";
    descDeCtrl.text = product!.itemsDescDe ?? "";
    descSpCtrl.text = product!.itemsDescSp ?? "";
    priceCtrl.text = product!.itemsPrice.toString();
    quantityCtrl.text = product!.itemsCount.toString();
    discountCtrl.text = product!.itemsDiscount.toString();

    isActive = product!.itemsActive == 1 ? true : false;
    productImage = File("${ApiLinks.itemImageRoot}/${product!.itemsImage!}");
    selectedCategory = product!.categoriesId;
    await getCategories();
  }

  pickCategImage() async {
    localImage = await image.pickImage(source: ImageSource.gallery);
    update();
  }

  @override
  editProduct() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await editProductData.editItem(
      image: localImage != null ? File(localImage!.path) : null,
      itemId: product!.itemsId,
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
      count: quantityCtrl.text,
      active: product!.itemsActive.toString(),
      categoryId: product!.categoriesId.toString(),
      imageName: product!.itemsImage,
    );
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        // Get.offNamed(AppRoutes.categories);
        Get.back(result: "refresh");
        Get.snackbar("Saved", "product edited successfully");
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

  @override
  getCategories() async {
    statusRequest = StatusRequest.loading;
    // update();
    var response = await editProductData.getCategories();
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
