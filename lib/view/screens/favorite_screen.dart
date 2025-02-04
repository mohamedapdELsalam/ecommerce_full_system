import 'package:ecommerceapp/core/screen_dimensions.dart';
import 'package:ecommerceapp/view/widgets/homepage/appbar/appbar_disktop.dart';
import 'package:ecommerceapp/view/widgets/homepage/appbar/appbar_mobile.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      Responsible(mobile: AppbarHomepage(), desktop: AppBardesktop()),
      Text("favorite screen")
    ]);
  }
}
