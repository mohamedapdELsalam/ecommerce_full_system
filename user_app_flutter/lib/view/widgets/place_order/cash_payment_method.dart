import 'package:ecommerceapp/controller/place_order_controller.dart';
import 'package:ecommerceapp/core/constants/image_assets.dart';
import 'package:ecommerceapp/core/constants/lang_keys.dart';
import 'package:ecommerceapp/view/widgets/place_order/checkout_choice_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CashPaymentChoice extends GetView<PlaceOrderController> {
  const CashPaymentChoice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CheckoutChoiceCard(
      title: Text(LangKeys.cash.tr),
      active: controller.paymentMethod == 0,
      onPressed: () {
        controller.changePaymentMethod(0);
      },
      trailing: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SvgPicture.asset(
          SvgAssets.cashLogo,
          height: 30,
        ),
      ),
    );
  }
}
