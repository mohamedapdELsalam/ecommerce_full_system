import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/core/constants/api_links.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:get/get.dart';

class NotificationData {
  MyServices myServices = Get.find();
  Crud crud = Crud();

  viewNotificationsRequest() async {
    var response = await crud.postRequest(ApiLinks.viewNotifications,
        {"userId": myServices.sharedPref.getInt("user_id").toString()});

    if (response.isRight()) {
      return response.fold(((l) => null), ((r) => r));
    } else {
      return response.fold(((l) => l), ((r) => null));
    }
  }
}
