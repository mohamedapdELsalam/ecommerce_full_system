import 'package:ecommerceapp/controller/auth/resetPassword_controller.dart';
import 'package:ecommerceapp/core/constants/lang_keys.dart';
import 'package:ecommerceapp/view/widgets/Auth/auth_button.dart';

import 'package:ecommerceapp/view/widgets/Auth/resetPasswordFields.dart';
import 'package:ecommerceapp/view/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/Auth/auth_title&subtitle.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordController controller = Get.put(ResetPasswordController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(LangKeys.verificationCode.tr,
            style: Theme.of(context).textTheme.bodyMedium),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ListView(
            children: [
              SizedBox(width: double.infinity),
              LogoApp(bottomMargin: 10, hight: 100, width: 100),
              TitleAndSubtitleAuth(
                title: LangKeys.resetPassword.tr,
                subtitle: LangKeys.resetPasswordSentence.tr,
                bottomMargin: 50,
              ),
              ResetPasswordFields(),
              AuthButton(
                  onPress: () {
                    controller.resetPassword();
                  },
                  title: LangKeys.save.tr),
            ],
          )),
    );
  }
}
