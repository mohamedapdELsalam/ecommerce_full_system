import 'package:flutter/material.dart';

class SpecialTitle extends StatelessWidget {
  const SpecialTitle({
    super.key,
    required this.myTheme,
  });

  final ThemeData myTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
      child: Row(
        children: [
          Text(
            "Special For You",
            style: myTheme.textTheme.titleMedium, // استخدام الثيم هنا
          ),
          const Spacer(),
          const Text("see all")
        ],
      ),
    );
  }
}
