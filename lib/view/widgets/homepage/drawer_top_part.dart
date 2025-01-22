import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/view/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DrawerTopPart extends StatelessWidget {
  const DrawerTopPart({
    super.key,
    required this.services,
  });

  final MyServices services;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: LogoApp(bottomMargin: 0, hight: 60, width: 60),
            ),
            Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${services.sharedPref.getString("user_email")}",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      "${services.sharedPref.getString("user_name")}",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ],
                ))
          ],
        ),
      ],
    );
  }
}
