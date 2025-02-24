import 'package:ecommerceapp/controller/cart_controller.dart';
import 'package:ecommerceapp/core/class/handlind_status_request.dart';
import 'package:ecommerceapp/view/widgets/cart/cart_checkout.dart';
import 'package:ecommerceapp/view/widgets/cart/cart_counter.dart';
import 'package:ecommerceapp/view/widgets/cart/cart_item_image.dart';
import 'package:ecommerceapp/view/widgets/cart/cart_remove_icon.dart';
import 'package:ecommerceapp/view/widgets/cart/cart_title_price.dart';
import 'package:ecommerceapp/view/widgets/cart/checkout_button.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CartController controller = Get.put(CartController());
    return SingleChildScrollView(
      child: Column(children: [
        Container(
            margin: EdgeInsets.only(top: 50),
            child: Text(
              "MY CART",
              style: TextStyle(fontSize: 25),
            )),
        GetBuilder<CartController>(
            builder: (controller) => HandlingStatusRequest(
                statusRequest: controller.statusRequest,
                widget: ListView.builder(
                    itemCount: controller.cartItems.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        child: SizedBox(
                          height: 140,
                          child: Stack(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Card(
                                    color:
                                        const Color.fromARGB(255, 34, 33, 33),
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 8),
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                    flex: 5,
                                                    child: CartItemImage(
                                                      i: index,
                                                    )),
                                                Expanded(
                                                    flex: 2,
                                                    child: CartCounterAndTotal(
                                                      i: index,
                                                    ))
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                              flex: 4,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  CartTitleAndPrice(
                                                      index: index),
                                                ],
                                              )),
                                          SizedBox(
                                            width: 10,
                                          ),
                                        ],
                                      ),
                                    )),
                              ),
                              Positioned(
                                  right: 10, top: 5, child: CartRemoveIcon()),
                            ],
                          ),
                        ),
                      );
                    }))),
        CartCheckout(),
        CheckoutButton(),
        SizedBox(
          height: 100,
        )
      ]),
    );
  }
}
