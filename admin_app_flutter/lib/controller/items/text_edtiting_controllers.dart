import 'package:flutter/material.dart';

class EditItemTextEditingCtrls {
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

  void disposeAll() {
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
}
