import 'package:ecommerceapp/controller/onBoarding_controller.dart';
import 'package:ecommerceapp/core/extensions/context_extensions.dart';
import 'package:ecommerceapp/core/screen_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingButton extends GetView<OnBoardingController> {
  final void Function()? onPress;
  final String? title;
  const OnBoardingButton({super.key, this.onPress, this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Responsible.isMobile(context)
          ? context.height * 0.05
          : Responsible.isPortrait(context)
              ? context.height * 0.09
              : context.height * 0.1,
      width: Responsible.isMobile(context)
          ? context.width * 0.35
          : Responsible.isPortrait(context)
              ? context.width * 0.15
              : context.width * 0.1,
      child: MaterialButton(
          padding: EdgeInsets.all(0),
          textColor: context.onSecondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          onPressed: onPress,
          color: context.secondaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetBuilder<OnBoardingController>(
                builder: (controller) => Text(controller.buttonText),
              ),
              SizedBox(width: 5),
              Icon(Icons.arrow_forward),
            ],
          )),
    );
  }
}
