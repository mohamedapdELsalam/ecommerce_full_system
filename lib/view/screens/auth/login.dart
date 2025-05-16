import 'package:ecommerceapp/controller/auth/login_controller.dart';
import 'package:ecommerceapp/core/class/handlind_status_request.dart';
import 'package:ecommerceapp/core/constants/lang_keys.dart';
import 'package:ecommerceapp/core/functions/alert_exit.dart';
import 'package:ecommerceapp/view/widgets/Auth/auth_button.dart';
import 'package:ecommerceapp/view/widgets/Auth/auth_socialIconsBar.dart';
import 'package:ecommerceapp/view/widgets/Auth/login_Fields.dart';
import 'package:ecommerceapp/view/widgets/Auth/login_bottomText.dart';
import 'package:ecommerceapp/view/widgets/Auth/login_optionsBar.dart';
import 'package:ecommerceapp/view/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/Auth/auth_title&subtitle.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    double hight = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(LangKeys.login.tr,
            style: Theme.of(context).textTheme.bodyMedium),
      ),
      body: PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            alertExit(context, LangKeys.warn.tr, LangKeys.exitMsg.tr,
                LangKeys.exit.tr, LangKeys.cancel.tr);
          },
          child: GetBuilder<LoginController>(
            builder: (controller) => HandlingStatusRequest(
                controller: controller,
                statusRequest: controller.statusRequest,
                widget: Row(
                  children: [
                    if (width >= 1200)
                      Container(
                        width: width * 0.3,
                        color: const Color.fromARGB(134, 222, 220, 220),
                        child: Column(
                          children: [
                            Text(
                              "Imagine as you like",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic, fontSize: 30),
                            ),
                          ],
                        ),
                      ),
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.08, vertical: hight * 0.01),
                        children: [
                          SizedBox(width: double.infinity),
                          LogoApp(
                            bottomMargin: 10,
                            hight: 100,
                            width: 100,
                          ),
                          TitleAndSubtitleAuth(
                            title: LangKeys.loginTitle.tr,
                            subtitle: LangKeys.loginSub.tr,
                            bottomMargin: 35,
                          ),
                          LoginFields(),
                          LoginOptionsBar(),
                          AuthButton(
                              onPress: () async {
                                controller.login(context);
                              },
                              title: LangKeys.login.tr),
                          AuthSocialIconsBar(),
                          LoginBottomText(
                            firsText: LangKeys.dontHaveAccount.tr,
                            SecondText: LangKeys.signup.tr,
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          )),
    );
  }
}
