import 'package:ecommerceapp/core/services/services.dart';
import 'package:get/get.dart';

SaveUserDataInStorage(Map data) {
  MyServices services = Get.find();
  services.sharedPref.setString("user_email", data["user_email"].toString());
  services.sharedPref.setInt("user_id", data["user_id"]);
  services.sharedPref.setString("user_name", data["user_name"].toString());
  services.sharedPref.setString("user_phone", data["user_phone"].toString());
  services.sharedPref
      .setString("user_password", data["user_password"].toString());
  services.sharedPref.setInt("step", 2);
}
