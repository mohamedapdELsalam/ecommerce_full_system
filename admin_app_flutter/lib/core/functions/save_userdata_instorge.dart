import 'package:adminapp/core/services/services.dart';
import 'package:adminapp/data/model/admin_model.dart';
import 'package:get/get.dart';

saveUserDataInStorage(AdminModel data) {
  MyServices services = Get.find();
  services.sharedPref.setString("admin_name", data.adminsName!);
  services.sharedPref.setInt("admin_id", data.adminsId!);
  services.sharedPref.setString("admin_phone", data.adminsPhone!);
  services.sharedPref.setString("admin_password", data.adminsPassword!);
  services.sharedPref.setInt("step", 2);
}
