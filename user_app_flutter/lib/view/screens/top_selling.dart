import 'package:ecommerceapp/core/constants/lang_keys.dart';
import 'package:ecommerceapp/core/extensions/context_extensions.dart';
import 'package:ecommerceapp/view/widgets/homepage/most_sell_products.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class TopSelling extends StatelessWidget {
  const TopSelling({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            LangKeys.topSelling.tr,
            style: context.textTheme.titleLarge!
                .copyWith(color: context.onSecondary),
          ),
        ),
        body: ListView(children: [MostSellProducts()]));
  }
}
