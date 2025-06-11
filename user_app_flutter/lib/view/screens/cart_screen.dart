import 'package:ecommerceapp/controller/cart_controller.dart';
import 'package:ecommerceapp/core/class/handlind_status_request.dart';
import 'package:ecommerceapp/core/constants/lang_keys.dart';
import 'package:ecommerceapp/view/widgets/cart/cart_checkout.dart';
import 'package:ecommerceapp/view/widgets/cart/cart_item.dart';
import 'package:ecommerceapp/view/widgets/cart/checkout_button.dart';
import 'package:ecommerceapp/view/widgets/cart/coupone_formfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    return Scaffold(
      appBar: AppBar(
        title: Text(LangKeys.cart.tr),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          GetBuilder<CartController>(
              builder: (controller) => HandlingStatusRequest(
                  controller: controller,
                  statusRequest: controller.statusRequest,
                  widget: ListView.builder(
                      physics: ScrollPhysics(),
                      itemCount: controller.cartItems.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return CartItem(
                          index: index,
                        );
                      }))),
          Column(
            children: [
              SizedBox(height: 80),
              CouponForm(),
              CartCheckout(),
              CheckoutButton(),
              SizedBox(height: 50),
            ],
          )
        ]),
      ),
    );
  }
}
