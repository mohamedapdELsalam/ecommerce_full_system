import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ecommerceapp/controller/onBoarding_controller.dart';
import 'package:ecommerceapp/core/extensions/context_extensions.dart';
import 'package:ecommerceapp/data/data_source/static/onboarding_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class OnboardingSlider extends GetView<OnBoardingController> {
  const OnboardingSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var appHeight = Get.size.height;
    // var appWidth = Get.size.width;
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (val) {
          controller.onPageChanged(val);
          controller.changeButtonText();
        },
        itemCount: onBoardingList.length,
        itemBuilder: (context, i) {
          return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                    flex: 2,
                    child: FittedBox(
                        child: Text(
                            style: context.textTheme.bodyMedium!
                                .copyWith(color: context.onPrimaryColor),
                            onBoardingList[i].title!.tr))),
                SizedBox(height: 10),
                Flexible(
                  flex: 9,
                  child: Center(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        height: appHeight * 0.3,
                        width: appHeight * 0.3,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(72, 255, 255, 255),
                          borderRadius: BorderRadius.circular(
                              200), // نصف القطر مش ضروري كبير جدًا
                        ),
                        child: Lottie.asset(
                          onBoardingList[i].image!,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Flexible(
                    flex: 3,
                    child: FittedBox(
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            textAlign: TextAlign.center,
                            onBoardingList[i].body!.tr,
                            textStyle: context.textTheme.bodyMedium!
                                .copyWith(color: context.onPrimaryColor),
                            speed: const Duration(milliseconds: 50),
                          ),
                        ],
                        totalRepeatCount: 1,
                        pause: const Duration(milliseconds: 1000),
                        displayFullTextOnTap: true,
                        stopPauseOnTap: true,
                      ),
                    )),
                SizedBox(height: 10),
              ]);
        });
  }
}
