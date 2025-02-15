import 'package:ecommerceapp/core/constants/app_routes.dart';
import 'package:get/get.dart';

abstract class CartControllerAbstract extends GetxController {
  showItem();
}

class CartController extends CartControllerAbstract {
  @override
  showItem() {
    Get.toNamed(AppRoutes.itemDetails, arguments: {"item"});
  }
}
