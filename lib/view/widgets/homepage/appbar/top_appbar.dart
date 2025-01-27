import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopAppBarHomepage extends StatelessWidget {
  const TopAppBarHomepage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // var appHeight = Get.size.height;
    // var appWidth = Get.size.width;
    var myColors = Get.theme.colorScheme;
    var myTheme = Get.theme;
    return Row(
      children: [
        FittedBox(
            child: Text("Ebn Aouf Markt",
                style: myTheme.textTheme.titleMedium!
                    .copyWith(color: myColors.onPrimary))),
        Spacer(),
        FittedBox(
            child: Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(98, 255, 255, 255),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.notifications_none_outlined,
                  ),
                )))
      ],
    );
  }
}
