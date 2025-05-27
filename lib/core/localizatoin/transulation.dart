import 'package:adminapp/core/localizatoin/languages/ar.dart';
import 'package:adminapp/core/localizatoin/languages/de.dart';
import 'package:adminapp/core/localizatoin/languages/en.dart';
import 'package:adminapp/core/localizatoin/languages/es.dart';
import 'package:get/get.dart';

class MyTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    "ar": arMap,
    "en": enMap,
    "de": deMap,
    "es": esMap,
  };
}
