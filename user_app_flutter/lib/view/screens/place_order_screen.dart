import 'package:ecommerceapp/controller/place_order_controller.dart';
import 'package:ecommerceapp/core/constants/lang_keys.dart';
import 'package:ecommerceapp/view/widgets/place_order/addresses.dart';
import 'package:ecommerceapp/view/widgets/place_order/cash_payment_method.dart';
import 'package:ecommerceapp/view/widgets/place_order/delievery_choice.dart';
import 'package:ecommerceapp/view/widgets/place_order/pay_online_choice.dart';
import 'package:ecommerceapp/view/widgets/place_order/place_order_button.dart';
import 'package:ecommerceapp/view/widgets/place_order/recieve_store_choice.dart';
import 'package:ecommerceapp/view/widgets/place_order/selected_delievery_method.dart';
import 'package:ecommerceapp/view/widgets/place_order/selected_payment.dart';
import 'package:ecommerceapp/view/widgets/place_order/selected_shipping_address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlaceOrderScreen extends StatelessWidget {
  const PlaceOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //  PlaceOrderController controller =
    Get.put(PlaceOrderController());
    return Scaffold(
      appBar: AppBar(
        title: Text(LangKeys.placeOrder.tr),
      ),
      body: GetBuilder<PlaceOrderController>(
        builder: (controller) => ListView(
          children: [
            Stepper(
              physics: NeverScrollableScrollPhysics(),
              currentStep: controller.currentStep,
              steps: [
                Step(
                    stepStyle: StepStyle(
                        color: controller.currentStep >= 0 &&
                                controller.deliveryMethod != null
                            ? Colors.green
                            : Colors.grey),
                    title: SelectedDeliveryMethod(),
                    content: Column(
                      children: [
                        DeliveryChoice(),
                        RecieveStoreChoice(),
                      ],
                    )),
                Step(
                    isActive: controller.deliveryMethod == 0,
                    stepStyle: StepStyle(
                        color: controller.currentStep >= 1 &&
                                    controller.shippingAddress != null ||
                                controller.deliveryMethod == 1
                            ? Colors.green
                            : Colors.grey),
                    title: SelectedShippingAddress(),
                    content: Addresses()),
                Step(
                    stepStyle: StepStyle(
                        color: controller.currentStep == 2 &&
                                controller.paymentMethod != null
                            ? Colors.amber
                            : Colors.grey),
                    title: SelectedPaymentMethod(),
                    content: Column(
                      children: [
                        CashPaymentChoice(),
                        PayOnlineChoice(),
                      ],
                    )),
              ],
              onStepTapped: (val) {
                controller.changeStep(val);
              },
              controlsBuilder: (context, details) => Text(""),
            ),
            PlaceOrderButton(),
            SizedBox(height: 100)
          ],
        ),
      ),
    );
  }
}
