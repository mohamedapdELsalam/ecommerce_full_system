import 'package:adminapp/controller/auth/forget_password/change_password_controller.dart';
import 'package:adminapp/core/constants/lang_keys.dart';
import 'package:adminapp/core/functions/validate_inputs.dart';
import 'package:adminapp/view/widgets/Auth/auth_textForm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordFields extends GetView<ChangePasswordController> {
  const ResetPasswordFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.always,
      key: controller.formKey,
      child: Column(
        children: [
          GetBuilder<ChangePasswordController>(
            builder:
                (myController) => TextFormAuth(
                  valid: (val) {
                    return validate(val!, 6, 50, "password", myController);
                  },
                  ctrl: controller.passwordCtrl,
                  hint: LangKeys.passwordFieldHint.tr,
                  label: LangKeys.newPassword.tr,
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
          SizedBox(height: 30),
          GetBuilder<ChangePasswordController>(
            builder:
                (myController) => TextFormAuth(
                  valid: (val) {
                    return validate(
                      val!,
                      6,
                      50,
                      "confirmPassword",
                      myController,
                    );
                  },
                  ctrl: controller.confirmPasswordCtrl,
                  hint: LangKeys.confirmHint.tr,
                  label: LangKeys.confirmPassword.tr,
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
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
