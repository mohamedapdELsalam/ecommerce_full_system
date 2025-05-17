import 'package:ecommerceapp/controller/cart_controller.dart';
import 'package:ecommerceapp/core/constants/lang_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CouponForm extends StatelessWidget {
  const CouponForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (controller) {
      if (controller.couponModel == null) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: [
              Expanded(
                  flex: 3,
                  child: TextFormField(
                    controller: controller.couponCtrl,
                    decoration: InputDecoration(
                        hintText: LangKeys.couponFiledHint.tr,
                        hintStyle: TextStyle(fontSize: 12),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  )),
              SizedBox(width: 20),
              Expanded(
                flex: 1,
                child: MaterialButton(
                    padding: EdgeInsets.all(5),
                    height: 43,
                    color: Colors.yellow,
                    onPressed: () {
                      controller.checkCoupon();
                    },
                    child: FittedBox(child: Text(LangKeys.apply.tr))),
              )
            ],
          ),
        );
      } else {
        return Text(
          "${controller.couponModel!.couponCode} coupon is active !",
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Theme.of(context).colorScheme.error),
        );
      }
    });
  }
}
