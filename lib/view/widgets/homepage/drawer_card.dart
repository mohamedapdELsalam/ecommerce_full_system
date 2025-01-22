import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DrawerCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData icon;
  final void Function()? ontap;
  const DrawerCard({
    required this.title,
    required this.icon,
    required this.ontap,
    this.subtitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.cyan,
      highlightColor: Colors.cyan[700],
      splashColor: const Color.fromARGB(17, 0, 150, 167),
      onTap: ontap,
      child: Card(
        child: ListTile(
          title: Text(
            title,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          subtitle: subtitle != null ? Text(subtitle!) : null,
          leading: Icon(
            icon,
            size: 20,
            color: Colors.cyan[800],
          ),
        ),
      ),
    );
  }
}
