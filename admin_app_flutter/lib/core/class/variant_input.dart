import 'package:adminapp/data/model/item_variant.dart';
import 'package:flutter/material.dart';

class VariantInput {
  int? id;
  TextEditingController priceController = TextEditingController();
  TextEditingController countController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController sizedController = TextEditingController();
  TextEditingController discountCtrl = TextEditingController();
  int? sizeId;
  int? colorId;
  String? colorHex;

  VariantInput(); // add variant from ui
  VariantInput.fromModel(ItemVariantsModel model) {
    // add variant from database
    id = model.stockId;
    priceController.text = model.stockPrice.toString();
    countController.text = model.stockCount.toString();
    colorController.text = model.colorsName ?? '';
    sizedController.text = model.sizesLabel ?? '';
    discountCtrl.text = model.itemsDiscount.toString();
    sizeId = model.sizesId;
    colorId = model.colorsId;
    colorHex = model.colorsHexcode;
  }

  ItemVariantsModel toModel() {
    return ItemVariantsModel(
      itemsId: id,
      stockPrice: int.parse(priceController.text),
      stockCount: int.parse(countController.text),
      colorsName: colorController.text,
      sizesLabel: sizedController.text,
      itemsDiscount: 5,
      sizesId: sizeId,
      colorsId: colorId,
      colorsHexcode: colorHex,
    );
  }

  bool hasChangedComparedTo(ItemVariantsModel original) {
    return priceController.text != original.stockPrice.toString() ||
        countController.text != original.stockCount.toString() ||
        colorId != original.colorsId ||
        sizeId != original.sizesId;
  }
  // discountCtrl.text != "5";

  // تنظيف الكنترولرات
  void dispose() {
    priceController.dispose();
    countController.dispose();
    colorController.dispose();
    sizedController.dispose();
    discountCtrl.dispose();
  }
}
