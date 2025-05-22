// import 'package:ecommerceapp/controller/auth/forget_password_controller.dart';
// import 'package:ecommerceapp/core/constants/lang_keys.dart';
// import 'package:ecommerceapp/testPackages.dart';
// import 'package:ecommerceapp/view/widgets/Auth/auth_button.dart';
// import 'package:ecommerceapp/view/widgets/logo.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../widgets/Auth/auth_title&subtitle.dart';

// class VerifyCodeMaghola extends StatelessWidget {
//   const VerifyCodeMaghola({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // VerifyCodeController controller = Get.put(VerifyCodeController());
//     ForgetPasswordController controller = Get.put(ForgetPasswordController());
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(LangKeys.verificationCode.tr,
//             style: Theme.of(context).textTheme.bodyMedium),
//       ),
//       body: Container(
//           padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               SizedBox(width: double.infinity),
//               LogoApp(bottomMargin: 0, hight: 100, width: 100),
//               TitleAndSubtitleAuth(
//                 title: LangKeys.verificationCode.tr,
//                 subtitle: LangKeys.verificationSentence.tr,
//                 veriable: "moalgouker@gmail.",
//                 bottomMargin: 50,
//               ),
//               OtpVerify(),
//               Spacer(),
//               AuthButton(
//                   onPress: () {
//                     controller.checkVerifyCode();
//                   },
//                   title: LangKeys.continueButton.tr),
//             ],
//           )),
//     );
//   }
// }
