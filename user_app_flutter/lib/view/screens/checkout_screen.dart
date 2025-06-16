import 'package:ecommerceapp/controller/checkout_controller.dart';
import 'package:ecommerceapp/core/constants/app_routes.dart';
import 'package:ecommerceapp/core/constants/image_assets.dart';
import 'package:ecommerceapp/core/constants/lang_keys.dart';
import 'package:ecommerceapp/core/functions/pay_with_paymob.dart';
import 'package:ecommerceapp/view/widgets/checkout/checkout_choice_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //  CheckoutController controller =
    Get.put(CheckoutController());
    return Scaffold(
      appBar: AppBar(
        title: Text(LangKeys.checkoutTitle.tr),
      ),
      body: GetBuilder<CheckoutController>(
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
                    title: Row(
                      children: [
                        Text(
                          LangKeys.deliveryMethod.tr,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        if (controller.deliveryMethod != null)
                          Text(
                              "  (${controller.deliveryMethod == 0 ? LangKeys.delivery.tr : controller.deliveryMethod == 1 ? LangKeys.receiveStore.tr : ""})")
                      ],
                    ),
                    content: Column(
                      children: [
                        CheckoutChoiceCard(
                          title: Text(LangKeys.delivery.tr),
                          active: controller.deliveryMethod == 0,
                          onPressed: () {
                            controller.changeDeliveryMethod(0);
                          },
                        ),
                        CheckoutChoiceCard(
                          title: Text(LangKeys.receiveStore.tr),
                          active: controller.deliveryMethod == 1,
                          onPressed: () {
                            controller.changeDeliveryMethod(1);
                          },
                        ),
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
                    title: Row(
                      children: [
                        Text(
                          LangKeys.address.tr,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        controller.deliveryMethod == 1
                            ? Text(" (${LangKeys.receiveStore.tr})")
                            : controller.shippingAddress != null
                                ? Text(
                                    "   (${controller.shippingAddress ?? ""})")
                                : Text("")
                      ],
                    ),
                    content: Column(
                      children: [
                        ...List.generate(
                            controller.addressesList.length,
                            (index) => CheckoutChoiceCard(
                                title:
                                    Text(controller.addressesList[index].name!),
                                subtitle: Text(
                                    "${controller.addressesList[index].cityAr!} / ${controller.addressesList[index].street!}"),
                                onPressed: () {
                                  controller.changeShippingAddress(
                                      controller.addressesList[index].name!);
                                  controller.addressId =
                                      controller.addressesList[index].addressId;
                                },
                                active: controller.shippingAddress ==
                                    controller.addressesList[index].name)),
                        if (controller.addressesList.isEmpty)
                          Card(
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  Get.toNamed(AppRoutes.addAddressLocation);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('اضف عنوان جديد'),
                                    Icon(Icons.add),
                                  ],
                                ),
                              ),
                            ),
                          )
                      ],
                    )),
                Step(
                    stepStyle: StepStyle(
                        color: controller.currentStep == 2 &&
                                controller.paymentMethod != null
                            ? Colors.amber
                            : Colors.grey),
                    title: Row(
                      children: [
                        Text(
                          LangKeys.paymentMethod.tr,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        if (controller.paymentMethod != null)
                          Text(
                              "   (${controller.paymentMethod == 0 ? "cash" : controller.paymentMethod == 1 ? "credit card" : ""})")
                      ],
                    ),
                    content: Column(
                      children: [
                        CheckoutChoiceCard(
                          title: Text(LangKeys.cash.tr),
                          active: controller.paymentMethod == 0,
                          onPressed: () {
                            controller.changePaymentMethod(0);
                          },
                          trailing: Icon(Icons.attach_money_outlined),
                        ),
                        CheckoutChoiceCard(
                          title: Text(
                            LangKeys.creditCards.tr,
                            textAlign: TextAlign.left,
                          ),
                          active: controller.paymentMethod == 1,
                          onPressed: () {
                            controller.changePaymentMethod(1);
                            payWithPaymob();
                          },
                          subtitle:
                              Row(mainAxisSize: MainAxisSize.min, children: [
                            SvgPicture.asset(
                              SvgAssets.masterCard,
                              height: 30,
                            ),
                            SvgPicture.asset(
                              SvgAssets.paypal,
                              height: 30,
                            ),
                            SvgPicture.asset(
                              SvgAssets.visaBlue,
                              height: 30,
                            )
                          ]),
                        ),
                      ],
                    )),
              ],
              onStepTapped: (val) {
                controller.changeStep(val);
              },
              controlsBuilder: (context, details) => Text(""),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: MaterialButton(
                minWidth: 300,
                height: 43,
                color: Colors.yellow,
                onPressed: () {
                  controller.checkout();
                },
                child: Text(LangKeys.checkoutButton.tr),
              ),
            ),
            SizedBox(height: 100)
          ],
        ),
      ),
    );
  }
}
