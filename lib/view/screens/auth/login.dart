import 'package:ecommerceapp/controller/auth/login_controller.dart';
import 'package:ecommerceapp/core/class/handlind_status_request.dart';
import 'package:ecommerceapp/core/functions/alert_exit.dart';
import 'package:ecommerceapp/data/data_source/static/static.dart';
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
    Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("22".tr, style: Theme.of(context).textTheme.bodyMedium),
      ),
      body: PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            alertExit(
                context, "warn ", " do you want to exit ?", "exit", "cancel");
          },
          child: GetBuilder<LoginController>(
            builder: (controller) => HandlingStatusRequest(
                statusRequest: controller.statusRequest,
                widget: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: ListView(
                      children: [
                        SizedBox(width: double.infinity),
                        LogoApp(
                          bottomMargin: 10,
                          hight: 100,
                          width: 100,
                        ),
                        TitleAndSubtitleAuth(
                          title: loginTitle,
                          subtitle: loginSubtitle,
                          bottomMargin: 35,
                        ),
                        LoginFields(),
                        LoginOptionsBar(),
                        AuthButton(
                            onPress: () async {
                              controller.login(context);
                            },
                            title: "22".tr),
                        AuthSocialIconsBar(),
                        LoginBottomText(
                          firsText: "38".tr,
                          SecondText: "37".tr,
                        ),
                      ],
                    ))),
          )),
    );
  }
}
