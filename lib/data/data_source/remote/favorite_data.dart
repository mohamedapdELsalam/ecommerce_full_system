import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/core/constants/api_links.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:get/get.dart';

class FavoriteData {
  Crud crud = Get.find();
  MyServices myServices = Get.find();

  FavoriteData();

  addFavorite(int itemId) async {
    var response = await crud.postRequest(ApiLinks.addFav, {
      "itemId": itemId.toString(),
      "userId": myServices.sharedPref.getInt("user_id").toString(),
    });

    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }

  deleteFavorite(itemId) async {
    MyServices myServices = Get.put(MyServices());
    var response = await crud.postRequest(ApiLinks.deleteFav, {
      "itemId": itemId.toString(),
      "userId": myServices.sharedPref.getInt("user_id").toString(),
    });

    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }

  viewFavorite() async {
    var response = await crud.postRequest(ApiLinks.viewFav, {
      "userId": myServices.sharedPref.getInt("user_id").toString(),
    });

    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }
}
