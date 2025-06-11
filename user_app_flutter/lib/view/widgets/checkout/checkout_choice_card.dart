import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckoutChoiceCard extends StatelessWidget {
  final void Function()? onPressed;
  final String? svg;
  final Widget? trailing;
  final Widget? title;
  final Widget? subtitle;
  final bool? active;

  const CheckoutChoiceCard({
    required this.onPressed,
    required this.active,
    this.svg,
    this.trailing,
    this.title,
    this.subtitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
      decoration: BoxDecoration(
          border: Border.all(
              width: 2, color: active! ? Colors.green : Colors.white),
          borderRadius: BorderRadius.circular(20),
          color: ColorScheme.of(context).onPrimary),
      child: ListTile(
        onTap: onPressed,
        enabled: true,
        title: svg == null
            ? title
            : SvgPicture.asset(
                svg!,
                alignment: Alignment.topLeft,
                height: 50,
              ),
        subtitle: subtitle,
        trailing: trailing ?? Text(""),
      ),
    );
  }
}
