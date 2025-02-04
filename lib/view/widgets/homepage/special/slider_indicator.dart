import 'package:ecommerceapp/controller/homepage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SliderIndicatorHomePage extends StatelessWidget {
  const SliderIndicatorHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomePageController controller = Get.put(HomePageController());
    return Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              controller.items_discount.length,
              (index) => AnimatedContainer(
                margin: const EdgeInsets.only(right: 10, bottom: 20),
                width: 10,
                height: 10,
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: controller.currentIndex.value == index
                        ? Theme.of(context).colorScheme.primary
                        : Colors.grey),
              ),
            )
          ],
        ));
  }
}
