import 'package:adminapp/core/class/status_request.dart';
import 'package:adminapp/core/constants/app_routes.dart';
import 'package:adminapp/core/functions/handling_status_request.dart';
import 'package:adminapp/core/functions/save_userdata_instorge.dart';
import 'package:adminapp/data/data_source/remote/auth/login.dart';
import 'package:adminapp/data/model/admin_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginControllerAbstract extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  StatusRequest statusRequest = StatusRequest.none;
  bool isRememberMeChecked = true;
  bool isDisapearPassword = true;
  AdminModel? adminData;
  login(BuildContext context);
  toggleRememberMe();
  goToSignup();
  goToForgetPassword();
  switchShowPassword();
  resetStatus();
}

class LoginController extends LoginControllerAbstract {
  @override
  switchShowPassword() {
    isDisapearPassword = !isDisapearPassword;
    update();
  }

  @override
  toggleRememberMe() {
    isRememberMeChecked = !isRememberMeChecked;
    update();
  }

  @override
  login(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      try {
        statusRequest = StatusRequest.loading;
        update();
        await Future.delayed(Duration(seconds: 2));
        var response = await LoginData().LoginRequiest(
          email: emailCtrl.text,
          password: passwordCtrl.text,
        );
        statusRequest = handlingStatusRequest(response);

        if (statusRequest == StatusRequest.success) {
          if (response["status"] == "success") {
            statusRequest = StatusRequest.success;
            Map<String, dynamic> data = response["data"];
            adminData = AdminModel.fromJson(data);
            saveUserDataInStorage(adminData!);
            FirebaseMessaging.instance.subscribeToTopic("admins");
            FirebaseMessaging.instance.subscribeToTopic(
              "admins${adminData!.adminsId}",
            );

            Get.offAllNamed(AppRoutes.homeScreen);
          } else {
            statusRequest = StatusRequest.failure;
            update();
            Get.defaultDialog(
              title: "error",
              middleText: response["message"],
              textConfirm: "ok",
              onConfirm: () {
                Get.back();
              },
            );
          }
        }

        update();
      } catch (e) {
        statusRequest = StatusRequest.failure;
        update();
        print("e:$e");
      }

      print("validate");
    }
  }

  @override
  goToSignup() {
    Get.offNamed(AppRoutes.signUp);
    isDisapearPassword = true;
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoutes.forgetPassword);
    isDisapearPassword = true;
  }

  @override
  void onInit() async {
    // FirebaseMessaging messaging = FirebaseMessaging.instance;

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void resetStatus() {
    statusRequest = StatusRequest.none;
    update();
  }
}
