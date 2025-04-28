import 'package:adminapp/controller/auth/signup_controller.dart';
import 'package:adminapp/core/class/handlind_status_request.dart';
import 'package:adminapp/core/functions/alert_exit.dart';
import 'package:adminapp/data/data_source/static/static.dart';
import 'package:adminapp/view/widgets/Auth/auth_button.dart';
import 'package:adminapp/view/widgets/Auth/auth_socialIconsBar.dart';
import 'package:adminapp/view/widgets/Auth/auth_title&subtitle.dart';
import 'package:adminapp/view/widgets/Auth/signup_bottomText.dart';
import 'package:adminapp/view/widgets/Auth/signup_fields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Get.put(SignUpController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("37".tr, style: Theme.of(context).textTheme.bodyMedium),
      ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          alertExit(
            context,
            "warn ",
            " do you want to exit ?",
            "exit",
            "cancel",
          );
        },
        child: ListView(
          children: [
            GetBuilder<SignUpController>(
              builder:
                  (controller) => HandlingStatusRequest(
                    controller: controller,
                    statusRequest: controller.statusRequest,
                    widget: Container(
                      child: ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                          horizontal: width >= 1200 ? 250 : 20,
                          vertical: 0,
                        ),
                        children: [
                          const SizedBox(width: double.infinity),
                          TitleAndSubtitleAuth(
                            title: signUpTitle,
                            subtitle: signUpSubtitle,
                            bottomMargin: 25,
                          ),
                          SignUpFields(),
                          AuthButton(
                            onPress: () {
                              controller.signUp();
                            },
                            title: "37".tr,
                          ),
                          const AuthSocialIconsBar(),
                          signupBottomText(
                            firsText: "39".tr,
                            SecondText: "22".tr,
                          ),
                        ],
                      ),
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
