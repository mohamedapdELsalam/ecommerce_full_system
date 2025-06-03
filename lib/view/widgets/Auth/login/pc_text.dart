import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ecommerceapp/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PcLoginText extends StatelessWidget {
  final String text;
  const PcLoginText({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      width: context.width * 0.3,
      color: context.onPrimaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                text,
                textStyle: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: context.secondaryColor,
                ),
                speed: const Duration(milliseconds: 50),
              ),
            ],
            totalRepeatCount: 1,
            pause: const Duration(milliseconds: 1000),
            displayFullTextOnTap: true,
            stopPauseOnTap: true,
          ),
        ],
      ),
    );
  }
}
