import 'package:flutter/material.dart';

class AdminCard extends StatelessWidget {
  final String title;
  final Widget image;
  final void Function() onTap;
  const AdminCard({
    super.key,
    required this.title,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [image, Text(title)],
        ),
      ),
    );
  }
}
