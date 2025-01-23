import 'package:flutter/material.dart';

class CategoriesTitle extends StatelessWidget {
  const CategoriesTitle({
    super.key,
    required this.myTheme,
  });

  final ThemeData myTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
      child: Row(
        children: [
          Text(
            "Categories",
            style: myTheme.textTheme.titleMedium, // استخدام الثيم هنا
          ),
          const Spacer(),
          const Text("see all")
        ],
      ),
    );
  }
}
