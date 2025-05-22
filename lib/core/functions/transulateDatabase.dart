import 'package:ecommerceapp/core/services/services.dart';
import 'package:get/get.dart';

String translateDatabase(
    String columnAr, String columnEn, String columnDe, String columnSp) {
  MyServices myservices = Get.find();
  var lang = myservices.sharedPref.getString("lang");

  return lang == "ar"
      ? columnAr
      : lang == "en"
          ? columnEn
          : lang == "de"
              ? columnDe
              : columnSp;
}
