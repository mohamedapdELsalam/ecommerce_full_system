import 'dart:io';
import 'package:adminapp/controller/items/text_edtiting_controllers.dart';
import 'package:adminapp/controller/items/variant_handler.dart';
import 'package:adminapp/core/class/status_request.dart';
import 'package:adminapp/core/class/variant_input.dart';
import 'package:adminapp/core/constants/api_links.dart';
import 'package:adminapp/core/functions/handling_status_request.dart';
import 'package:adminapp/core/functions/upload_image.dart';
import 'package:adminapp/data/data_source/remote/items/add_item_data.dart';
import 'package:adminapp/data/data_source/remote/items/edit_item_data.dart';
import 'package:adminapp/data/model/category_model.dart';
import 'package:adminapp/data/model/color_model.dart';
import 'package:adminapp/data/model/item_model.dart';
import 'package:adminapp/data/model/item_variant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

abstract class EditItemControllerAbstract extends GetxController {
  late EditItemTextEditingCtrls ctrls;
  ItemModel? item;
  bool? isActive;
  List<CategoryModel> categories = [];
  List<ItemVariantsModel> originalVariants = [];
  List<VariantInput> variantInputs = [];
  int? selectedCategory;
  List<ColorModel> colors = [];
  List sizes = [];
  AddItemData addProductData = AddItemData();
  VariantHandler? variantHandler;
  StatusRequest statusRequest = StatusRequest.none;
  EditItemData editProductData = EditItemData();
  ImagePicker image = ImagePicker();
  File? productImage;
  File? localImage;
  Future<void> loadData();
  Future<void> editProduct();
  Future<void> getCategories();
  void initializeFields();
  void pickCategImage();
}

class EditItemController extends EditItemControllerAbstract {
  GlobalKey<FormState> myFormKey = GlobalKey();

  @override
  void onInit() async {
    super.onInit();
    item = Get.arguments["model"];
    ctrls = EditItemTextEditingCtrls();
    initializeFields();
    loadData();
    isActive = item!.itemsActive == 1 ? true : false;
    productImage = File("${ApiLinks.itemImageRoot}/${item!.itemsImage!}");
    selectedCategory = item!.categoriesId;
  }

  @override
  Future<void> loadData() async {
    await getCategories();
    variantHandler = VariantHandler();
    await variantHandler!.getColors();
    await variantHandler!.getSizes();
    await variantHandler!.getProductVariants(item!);
  }

  @override
  pickCategImage() async {
    localImage = await uploadImage(allowExt: ["jpg", "heic"]);
    update();
  }

  @override
  initializeFields() {
    ctrls.nameArCtrl.text = item!.itemsNameAr ?? "";
    ctrls.nameEnCtrl.text = item!.itemsNameEn ?? "";
    ctrls.nameDeCtrl.text = item!.itemsNameDe ?? "";
    ctrls.nameSpCtrl.text = item!.itemsNameSp ?? "";
    ctrls.descArCtrl.text = item!.itemsDescAr ?? "";
    ctrls.descEnCtrl.text = item!.itemsDescEn ?? "";
    ctrls.descDeCtrl.text = item!.itemsDescDe ?? "";
    ctrls.descSpCtrl.text = item!.itemsDescSp ?? "";
    ctrls.priceCtrl.text = item!.itemsPrice.toString();
    ctrls.quantityCtrl.text = item!.itemsCount.toString();
    ctrls.discountCtrl.text = item!.itemsDiscount.toString();
  }

  @override
  editProduct() async {
    if (!myFormKey.currentState!.validate()) return;
    statusRequest = StatusRequest.loading;
    update();
    final List<int?> deletedVariants = variantHandler!.getDeletedVariants();
    final List<Map> newVariants = variantHandler!.getNewVariants();
    final List<Map> editedVariants = variantHandler!.getEditedVariants();

    var response = await editProductData.editItem(
      image: localImage != null ? File(localImage!.path) : null,
      itemId: item!.itemsId,
      nameAr: ctrls.nameArCtrl.text,
      nameEn: ctrls.nameEnCtrl.text,
      nameDe: ctrls.nameDeCtrl.text,
      nameSp: ctrls.nameSpCtrl.text,
      descAr: ctrls.descArCtrl.text,
      descEn: ctrls.descEnCtrl.text,
      descDe: ctrls.descDeCtrl.text,
      descSp: ctrls.descSpCtrl.text,
      discount: ctrls.discountCtrl.text,
      price: ctrls.priceCtrl.text,
      count: ctrls.quantityCtrl.text,
      active: isActive! ? "1" : "0",
      categoryId: item!.categoriesId.toString(),
      imageName: item!.itemsImage,
      newVariants: newVariants,
      editedVariants: editedVariants,
      deletedVariants: deletedVariants,
    );

    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        Get.back(result: "refresh");
        Get.snackbar("Saved", "product edited successfully");
      } else {
        if (editedVariants.isEmpty &&
            newVariants.isEmpty &&
            deletedVariants.isEmpty) {
          statusRequest = StatusRequest.failure;
          return Get.defaultDialog(
            title: "fail",
            middleText: "you dont edit any thing",
          );
        }
      }
    } else {
      Get.defaultDialog(title: "fail", middleText: "check variant fields");
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
    ctrls.disposeAll();
  }
}
