import 'package:ecommerceapp/core/class/status_request.dart';
import 'package:ecommerceapp/core/functions/handlindStatusRequest.dart';
import 'package:ecommerceapp/data/data_source/remote/notification_data.dart';
import 'package:ecommerceapp/data/model/notification_model.dart';
import 'package:get/get.dart';

abstract class NotificationControllerAbstract extends GetxController {
  NotificationData notificationData = NotificationData();
  List<NotificationModel> notifications = [];
  StatusRequest statusRequest = StatusRequest.none;
  void getNotifications();
}

class NotificationController extends NotificationControllerAbstract {
  @override
  void onInit() {
    super.onInit();
    getNotifications();
  }

  @override
  void getNotifications() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await notificationData.viewNotificationsRequest();
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        List data = response["data"];
        notifications.addAll(data.map((e) => NotificationModel.fromJson(e)));
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }
}
