import 'package:ecommerceapp/data/model/items_model.dart';
import 'package:get/get.dart';

abstract class ItemsDetailsAbsract extends GetxController {
  late ItemsModel item;
}

class ItemsDetailsController extends ItemsDetailsAbsract {
  @override
  void onInit() {
    item = Get.arguments["item"];
    super.onInit();
  }
}
