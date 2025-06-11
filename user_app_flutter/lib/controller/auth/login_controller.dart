import 'package:ecommerceapp/core/class/status_request.dart';
import 'package:ecommerceapp/core/constants/app_routes.dart';
import 'package:ecommerceapp/core/functions/handlindStatusRequest.dart';
import 'package:ecommerceapp/core/functions/save_userdata_instorge.dart';
import 'package:ecommerceapp/data/data_source/remote/auth/login.dart';
import 'package:ecommerceapp/data/data_source/static/settings_options.dart';
import 'package:ecommerceapp/data/model/user_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginControllerAbstract extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  StatusRequest statusRequest = StatusRequest.none;
  bool isRememberMeChecked = true;
  bool isDisappearPassword = true;
  UserModel userData = UserModel();

  Future<void> login(BuildContext context);
  void toggleRememberMe();
  void goToSignup();
  void goToForgetPassword();
  void switchShowPassword();
  void resetStatus();
}

class LoginController extends LoginControllerAbstract {
  @override
  switchShowPassword() {
    isDisappearPassword = !isDisappearPassword;
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
        var response = await LoginData()
            .loginRequest(email: emailCtrl.text, password: passwordCtrl.text);
        statusRequest = handlingStatusRequest(response);

        if (statusRequest == StatusRequest.success) {
          if (response["status"] == "success") {
            statusRequest = StatusRequest.success;
            Map<String, dynamic> data = response["data"];
            userData = UserModel.fromJson(data);
            saveUserDataInStorage(data);
            if (!kIsWeb) {
              FirebaseMessaging.instance.subscribeToTopic("users");
              FirebaseMessaging.instance
                  .subscribeToTopic("users${response["data"]["user_id"]}");
            }
            if (userData.userApprove == 0) {
              myServices.sharedPref.setInt("approve", 0);
              statusRequest = StatusRequest.none;
              update();
              Get.defaultDialog(
                  barrierDismissible: false,
                  title: "warn",
                  middleText: "you must verify your email",
                  textConfirm: "go to verify email",
                  onConfirm: () {
                    Get.offNamed(AppRoutes.signupVerifyEmail,
                        arguments: {"email": emailCtrl.text});
                    print("mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm");
                  });
            } else if (userData.userApprove == 1) {
              myServices.sharedPref.setInt("approved", 1);
              Get.offAllNamed(AppRoutes.homeScreen);
              return;
            }
          } else {
            statusRequest = StatusRequest.failure;
            update();
            Get.defaultDialog(
                title: "error",
                middleText: response["message"],
                textConfirm: "ok",
                onConfirm: () {
                  Get.back();
                });
          }
        }
      } catch (e) {
        statusRequest = StatusRequest.exceptionFailure;
        print("e:$e");
      }

      print("validate");
    }
    statusRequest = StatusRequest.none;
    update();
  }

  @override
  goToSignup() {
    Get.offNamed(AppRoutes.signUp);
    isDisappearPassword = true;
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoutes.forgetPassword);
    isDisappearPassword = true;
  }

  @override
  void onInit() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    await messaging.getToken().then((value) {
      String? token = value;
      print("token is : $token");
    });
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
