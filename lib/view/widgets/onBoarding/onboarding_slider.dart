import 'package:ecommerceapp/controller/onBoarding_controller.dart';
import 'package:ecommerceapp/data/data_source/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class OnboardingSlider extends GetView<OnBoardingController> {
  const OnboardingSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                Spacer(flex: 1),
                // const SizedBox(height: 20),
                Text(onBoardingList[i].title!),
                //  const SizedBox(height: 80),
                Spacer(
                  flex: 2,
                ),
                Stack(children: [
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(72, 255, 255, 255),
                          borderRadius: BorderRadius.all(Radius.circular(200))),
                      height: 200,
                      width: 200,
                    ),
                  ),
                  Center(
                      child: Lottie.asset(onBoardingList[i].image!,
                          height: 200, width: 200)),
                ]),
                Spacer(flex: 2),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Text(onBoardingList[i].body!),
                ),
                Spacer(flex: 2),
              ]);
        });
  }
}
