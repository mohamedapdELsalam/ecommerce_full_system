import 'package:ecommerceapp/controller/onBoarding_controller.dart';
import 'package:ecommerceapp/data/data_source/static/onboarding_list.dart';
import 'package:ecommerceapp/view/widgets/onBoarding/onboarding_button.dart';
import 'package:ecommerceapp/view/widgets/onBoarding/onboarding_ctrl_slider.dart';
import 'package:ecommerceapp/view/widgets/onBoarding/onboarding_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    OnBoardingController controller = Get.put(OnBoardingController());

    return GetBuilder<OnBoardingController>(
      builder: (_) => Scaffold(
        backgroundColor: onBoardingList[controller.currentPage].backGroundColor,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Expanded(flex: 6, child: OnboardingSlider()),
                const Flexible(flex: 3, child: OnboardingControllerSlider()),
                Flexible(
                  flex: 1,
                  child: OnBoardingButton(
                    onPress: () {
                      controller.next();
                      controller.changeButtonText();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
