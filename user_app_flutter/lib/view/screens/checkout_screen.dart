import 'package:ecommerceapp/controller/checkout_controller.dart';
import 'package:ecommerceapp/core/constants/app_routes.dart';
import 'package:ecommerceapp/core/constants/image_assets.dart';
import 'package:ecommerceapp/core/constants/lang_keys.dart';
import 'package:ecommerceapp/core/paymob_flash_manager/pay_with_paymob.dart';
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
                          trailing: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: SvgPicture.asset(
                              SvgAssets.cashLogo,
                              height: 30,
                            ),
                          ),
                        ),
                        CheckoutChoiceCard(
                          title: Text(
                            LangKeys.payOnline.tr,
                            textAlign: TextAlign.start,
                          ),
                          active: controller.paymentMethod == 3,
                          onPressed: () {
                            controller.changePaymentMethod(3);
                            payWithPaymobFlash(
                                context: context,
                                amount: controller.totalPrice);
                          },
                          trailing: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                SvgAssets.vodafoneLogo,
                                height: 30,
                              ),
                              SizedBox(width: 10),
                              SvgPicture.asset(
                                SvgAssets.orangeLogo,
                                height: 25,
                              ),
                              SizedBox(width: 10),
                              SvgPicture.asset(
                                SvgAssets.etisalatLogo,
                                height: 25,
                              ),
                              SizedBox(width: 5),
                              SvgPicture.asset(
                                SvgAssets.masterCard,
                                height: 25,
                              ),
                              SizedBox(width: 5),
                              SvgPicture.asset(
                                SvgAssets.visaYellow,
                                height: 25,
                              ),
                              SizedBox(width: 5),
                            ],
                          ),
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
