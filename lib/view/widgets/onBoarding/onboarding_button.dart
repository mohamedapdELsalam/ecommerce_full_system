import 'package:ecommerceapp/controller/onBoarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingButton extends GetView<OnBoardingController> {
  final void Function()? onPress;
  final String? title;
  const OnBoardingButton({this.onPress, this.title});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        height: 38,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 100),
        onPressed: onPress,
        color: Theme.of(context).colorScheme.onPrimary,
        child: GetBuilder<OnBoardingController>(
          builder: (controller) => Text(controller.ButtonText),
        ));
  }
}
