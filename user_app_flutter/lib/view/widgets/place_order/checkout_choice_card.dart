import 'package:ecommerceapp/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/utils.dart';

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
      height: 70,
      margin: EdgeInsets.all(4),
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
      decoration: BoxDecoration(
          border: Border.all(
              width: 2, color: active! ? Colors.green : Colors.white),
          borderRadius: BorderRadius.circular(20),
          color: context.onPrimaryColor),
      child: ListTile(
        contentPadding: EdgeInsets.all(5),
        titleTextStyle: context.textTheme.labelLarge,
        onTap: onPressed,
        enabled: true,
        title: svg == null
            ? title
            : SvgPicture.asset(
                svg!,
                alignment: Alignment.topLeft,
                height: 30,
              ),
        subtitle: subtitle,
        trailing: trailing ?? Text(""),
      ),
    );
  }
}
