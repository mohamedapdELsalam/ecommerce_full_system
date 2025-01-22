import 'package:ecommerceapp/controller/onBoarding_controller.dart';
import 'package:ecommerceapp/data/data_source/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingControllerSlider extends StatelessWidget {
  const OnboardingControllerSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingController());
    return GetBuilder<OnBoardingController>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  onBoardingList.length,
                  (index) => AnimatedContainer(
                    margin: const EdgeInsets.only(right: 10, bottom: 70),
                    width: controller.currentPage == index ? 20 : 10,
                    height: 10,
                    duration: const Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: controller.currentPage == index
                            ? Theme.of(context).colorScheme.primary
                            : Colors.grey),
                  ),
                )
              ],
            ));
  }
}
