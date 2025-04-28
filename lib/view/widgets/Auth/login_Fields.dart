import 'package:adminapp/controller/auth/login_controller.dart';
import 'package:adminapp/core/functions/validate_inputs.dart';
import 'package:adminapp/view/widgets/Auth/auth_textForm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginFields extends GetView<LoginController> {
  const LoginFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.always,
      key: controller.formKey,
      child: Column(
        children: [
          TextFormAuth(
            valid: (val) {
              return validate(val!, 5, 100, "email", controller);
            },
            ctrl: controller.emailCtrl,
            hint: "27".tr,
            label: "23".tr,
            icon: Icon(Icons.email),
          ),
          SizedBox(height: 30),
          GetBuilder<LoginController>(
            builder:
                (myController) => TextFormAuth(
                  valid: (val) {
                    return validate(val!, 6, 30, "password", myController);
                  },
                  ctrl: myController.passwordCtrl,
                  hint: "28".tr,
                  label: "24".tr,
                  obscure: myController.isDisapearPassword,
                  onIconTap: () {
                    myController.switchShowPassword();
                  },
                  icon:
                      myController.isDisapearPassword
                          ? Icon(Icons.remove_red_eye)
                          : Icon(Icons.remove_red_eye_outlined),
                ),
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }
}
