import 'package:adminapp/core/class/crud.dart';
import 'package:adminapp/core/constants/api_links.dart';
import 'package:adminapp/core/services/services.dart';
import 'package:get/get.dart';

class ItemViewData {
  Crud crud = Crud();
  MyServices myServices = Get.find();

  getItems() async {
    var response = await crud.getRequest(ApiLinks.viewProducts);
    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }

  deleteItem(int productId, String imageName) async {
    var response = await crud.postRequest(ApiLinks.deleteProduct, {
      "id": productId.toString(),
      "imageName": imageName,
    });
    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }
}
