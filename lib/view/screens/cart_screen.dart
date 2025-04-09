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
    Get.put(CartController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
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
                        return SizedBox(
                          child: SizedBox(
                            height: 140,
                            child: Stack(
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Card(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 8),
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 3,
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
                                                      child:
                                                          CartCounterAndTotal(
                                                        i: index,
                                                      ))
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                                flex: 5,
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
                                    right: 10,
                                    top: 5,
                                    child: CartRemoveIcon(
                                        onConfirm: () {
                                          controller.deleteFromCart(controller
                                              .cartItems[index].itemsId!);
                                          Navigator.pop(context);
                                        },
                                        title: "warn",
                                        content: Text(
                                          "do you agreed to remove ${controller.cartItems[index].itemsNameEn} from cart",
                                          textAlign: TextAlign.center,
                                        ),
                                        cartItem: controller.cartItems[index])),
                              ],
                            ),
                          ),
                        );
                      }))),
          SizedBox(height: 20),
          CouponForm(),
          CartCheckout(),
          CheckoutButton(),
          SizedBox(height: 10),
          SizedBox(height: 50),
        ]),
      ),
    );
  }
}

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
                        hintText: "enter a coupon here ",
                        hintStyle: TextStyle(fontSize: 15),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  )),
              SizedBox(width: 20),
              Expanded(
                flex: 1,
                child: MaterialButton(
                    padding: EdgeInsets.all(2),
                    height: 43,
                    color: Colors.yellow,
                    onPressed: () {
                      controller.checkCoupon();
                    },
                    child: FittedBox(child: Text("apply"))),
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
