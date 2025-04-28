import 'package:adminapp/controller/auth/resetPassword_controller.dart';
import 'package:adminapp/core/functions/validate_inputs.dart';
import 'package:adminapp/view/widgets/Auth/auth_textForm.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordFields extends StatelessWidget {
  const ResetPasswordFields({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordController controller = Get.put(ResetPasswordController());

    return Form(
      autovalidateMode: AutovalidateMode.always,
      key: controller.formKey,
      child: Column(
        children: [
          GetBuilder<ResetPasswordController>(
            builder:
                (myController) => TextFormAuth(
                  valid: (val) {
                    return validate(val!, 6, 50, "password", myController);
                  },
                  ctrl: controller.passwordCtrl,
                  hint: "31".tr,
                  label: "New password",
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
          GetBuilder<ResetPasswordController>(
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
                  ctrl: controller.passConfirmCtrl,
                  hint: "29".tr,
                  label: "Confirm Password",
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
