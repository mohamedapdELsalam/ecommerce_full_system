import 'dart:io';

import 'package:adminapp/core/class/status_request.dart';
import 'package:adminapp/core/constants/api_links.dart';
import 'package:adminapp/core/functions/handling_status_request.dart';
import 'package:adminapp/core/functions/upload_image.dart';
import 'package:adminapp/data/data_source/remote/items/edit_item_data.dart';
import 'package:adminapp/data/model/category_model.dart';
import 'package:adminapp/data/model/item_model.dart';
import 'package:adminapp/data/model/item_variant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

abstract class EditItemControllerAbstract extends GetxController {
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
  ItemModel? item;
  bool? isActive;
  List<CategoryModel> categories = [];
  List<ItemVariantsModel> variants = [];
  int? selectedCategory;

  StatusRequest statusRequest = StatusRequest.none;
  EditItemData editProductData = EditItemData();
  ImagePicker image = ImagePicker();
  File? productImage;
  File? localImage;
  Future<void> editProduct();
  Future<void> getCategories();
  Future<void> getProductVariants();
}

class EditItemController extends EditItemControllerAbstract {
  GlobalKey<FormState> myGlobalKey = GlobalKey();

  @override
  void onInit() async {
    super.onInit();
    item = Get.arguments["model"];
    print("--------------------- yossef -------------------");
    print(item);
    nameArCtrl.text = item!.itemsNameAr ?? "";
    nameEnCtrl.text = item!.itemsNameEn ?? "";
    nameDeCtrl.text = item!.itemsNameDe ?? "";
    nameSpCtrl.text = item!.itemsNameSp ?? "";
    descArCtrl.text = item!.itemsDescAr ?? "";
    descEnCtrl.text = item!.itemsDescEn ?? "";
    descDeCtrl.text = item!.itemsDescDe ?? "";
    descSpCtrl.text = item!.itemsDescSp ?? "";
    priceCtrl.text = item!.itemsPrice.toString();
    quantityCtrl.text = item!.itemsCount.toString();
    discountCtrl.text = item!.itemsDiscount.toString();

    isActive = item!.itemsActive == 1 ? true : false;
    productImage = File("${ApiLinks.itemImageRoot}/${item!.itemsImage!}");
    selectedCategory = item!.categoriesId;
    await getCategories();
  }

  pickCategImage() async {
    localImage = await uploadImage(allowExt: ["jpg", "heic"]);

    update();
  }

  @override
  editProduct() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await editProductData.editItem(
      image: localImage != null ? File(localImage!.path) : null,
      itemId: item!.itemsId,
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
      active: isActive! ? "1" : "0",
      categoryId: item!.categoriesId.toString(),
      imageName: item!.itemsImage,
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
  Future<void> getProductVariants() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await editProductData.getProcutVariants();
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        List data = response["data"];
        variants.addAll(data.map((e) => ItemVariantsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      print("error 404 hahaha");
    }
    update();
  }
}
