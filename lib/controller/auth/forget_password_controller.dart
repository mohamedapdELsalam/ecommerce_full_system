// import 'package:ecommerceapp/core/class/status_request.dart';
// import 'package:ecommerceapp/core/constants/app_routes.dart';
// import 'package:ecommerceapp/core/functions/handlindStatusRequest.dart';
// import 'package:ecommerceapp/core/services/services.dart';
// import 'package:ecommerceapp/data/data_source/remote/auth/forget_password_data.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// abstract class ForgetPasswordControllerAbstract extends GetxController {
//   StatusRequest statusRequest = StatusRequest.none;
//   GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   TextEditingController emailCtrl = TextEditingController();
//   TextEditingController passwordCtrl = TextEditingController();
//   TextEditingController confirmPasswordCtrl = TextEditingController();
//   ForgetPasswordData forgetPasswordData = ForgetPasswordData();
//   MyServices myServices = Get.find();
//   String? verifyCode;
//   bool isDisapearPassword = true;
//   checkEmail();
//   checkVerifyCode();
//   changePassword(String, String password);
//   returnToLogin();
//   switchShowPassword() {
//     isDisapearPassword = !isDisapearPassword;
//     print(" is show password :  $isDisapearPassword");
//     update();
//   }
// }

// class ForgetPasswordController extends ForgetPasswordControllerAbstract {
//   bool isRememberMeChecked = false;

//   @override
//   checkEmail() async {
//     if (formKey.currentState!.validate()) {
//       statusRequest = StatusRequest.loading;
//       update();
//       var response = await forgetPasswordData.checkEmail(emailCtrl.text);
//       statusRequest = handlingStatusRequest(response);
//       if (statusRequest == StatusRequest.success) {
//         if (response["status"] == "success") {
//           Get.toNamed(AppRoutes.verifyEmail);
//         } else {
//           statusRequest = StatusRequest.failure;
//           update();
//         }
//       } else {
//         statusRequest = StatusRequest.serverFailure;
//         update();
//       }
//     }
//   }

//   @override
//   void onInit() {
//     super.onInit();
//   }

//   @override
//   void onClose() {
//     super.onClose();
//   }

//   @override
//   changePassword(email, password) async {
//     statusRequest = StatusRequest.loading;
//     update();
//     var response = await forgetPasswordData.changePassword(
//         emailCtrl.text, passwordCtrl.text);
//     statusRequest = handlingStatusRequest(response);
//     if (statusRequest == StatusRequest.success) {
//       if (response["status"] == "success") {
//         Get.offAll(AppRoutes.login);
//       } else {
//         statusRequest = StatusRequest.failure;
//         update();
//       }
//     } else {
//       statusRequest = StatusRequest.serverFailure;
//       update();
//     }
//   }

//   @override
//   checkVerifyCode() async {
//     statusRequest = StatusRequest.loading;
//     update();
//     var response =
//         await forgetPasswordData.checkVerifyCode(emailCtrl.text, verifyCode!);
//     print(
//         "----------------- verifyCode otp is : $verifyCode ------------------");
//     statusRequest = handlingStatusRequest(response);
//     if (statusRequest == StatusRequest.success) {
//       if (response["status"] == "success") {
//         Get.offNamed(AppRoutes.resetPassword);
        
//       } else {
//         statusRequest = StatusRequest.failure;
//         update();
//       }
//     } else {
//       statusRequest = StatusRequest.serverFailure;
//       update();
//     }
//   }

//   @override
//   returnToLogin() {
//     Get.offNamed(AppRoutes.login);
//   }
// }
