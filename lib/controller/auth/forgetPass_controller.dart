// import 'package:ecommerceapp/core/constants/app_routes.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// abstract class ForgetPasswordControllerAbstract extends GetxController {
//   TextEditingController emailCtrl = TextEditingController();
//   GlobalKey<FormState> formKey = GlobalKey();

//   checkEmail();
//   returnToLogin();
// }

// class ForgetPasswordController extends ForgetPasswordControllerAbstract {
//   bool isRememberMeChecked = false;

//   @override
//   checkEmail() {
//     if (formKey.currentState!.validate()) {
//       Get.offNamed(AppRoutes.verifyCode);
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
//   returnToLogin() {
//     Get.offNamed(AppRoutes.login);
//   }
// }
