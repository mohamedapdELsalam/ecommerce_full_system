import 'package:ecommerceapp/controller/onBoarding_controller.dart';
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

    return GetX<OnBoardingController>(
      builder: (_) => Scaffold(
        backgroundColor: controller.pageColor.value == 0
            ? const Color.fromARGB(255, 160, 41, 41)
            : controller.pageColor.value == 1
                ? Colors.cyan[900]
                : controller.pageColor.value == 2
                    ? const Color.fromARGB(192, 226, 207, 37)
                    : Colors.blueAccent,
        body: SafeArea(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  flex: 3,
                  child: OnboardingSlider(),
                ),
                Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        const OnboardingControllerSlider(),
                        OnBoardingButton(
                          onPress: () {
                            controller.next();
                            controller.changeButtonText();
                          },
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
