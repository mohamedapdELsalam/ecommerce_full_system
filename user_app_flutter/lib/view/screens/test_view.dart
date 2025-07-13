import 'package:ecommerceapp/controller/test_controller.dart';
import 'package:ecommerceapp/core/constants/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.scale(
                scale: 0.3, child: Lottie.asset(LottiesAssets.ecommerceMobil))
          ],
        ),
      ),
    ));
  }
}
