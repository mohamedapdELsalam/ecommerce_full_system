import 'package:ecommerceapp/controller/checkout_controller.dart';
import 'package:ecommerceapp/core/constants/app_routes.dart';
import 'package:ecommerceapp/core/constants/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutController controller = Get.put(CheckoutController());
    return Scaffold(
      appBar: AppBar(
        title: Text("checkout"),
      ),
      body: Container(
        child: GetBuilder<CheckoutController>(
          builder: (controller) => Stepper(
            currentStep: controller.currentStep,
            steps: [
              Step(
                  title: Text("طريقة التوصيل"),
                  content: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {}, icon: Icon(Icons.check_box)),
                          Container(
                            child: Text("ديليفري"),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon:
                                  Icon(Icons.check_box_outline_blank_outlined)),
                          Container(
                            child: Text("الاستلام من المتجر"),
                          ),
                        ],
                      ),
                    ],
                  )),
              Step(
                  title: Text("العنوان"),
                  content: Column(
                    children: [
                      ...List.generate(
                        controller.AddressesList!.length,
                        (index) => Card(
                          child: ListTile(
                            leading: Icon(Icons.check_box_outline_blank),
                            title: Text(
                                "${controller.AddressesList![index].name}"),
                            subtitle: Text(
                                "${controller.AddressesList![index].cityAr} / ${controller.AddressesList![index].street}   "),
                            trailing: Icon(Icons.location_pin),
                          ),
                        ),
                      ),
                      if (controller.AddressesList!.isEmpty)
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
                  title: Text("وسيلة الدفع"),
                  content: Column(
                    children: [
                      checkoutChoiceCard(
                        onPressed: () {},
                        svg: SvgAssets.paypal,
                      ),
                      checkoutChoiceCard(
                        onPressed: () {},
                        svg: SvgAssets.masterCard,
                      ),
                      checkoutChoiceCard(
                        onPressed: () {},
                        svg: SvgAssets.visaYellow,
                      ),
                      checkoutChoiceCard(
                        onPressed: () {},
                        title: Text("cash"),
                      ),
                    ],
                  )),
            ],
            onStepContinue: () {
              controller.nextStep();
            },
            onStepCancel: () {
              print("------- cancel");
            },
            onStepTapped: (val) {
              controller.changeStep(val);
            },
          ),
        ),
      ),
    );
  }
}

class checkoutChoiceCard extends StatelessWidget {
  final void Function()? onPressed;
  final String? svg;
  final Widget? trailing;
  final Widget? title;

  const checkoutChoiceCard({
    required this.onPressed,
    this.svg,
    this.trailing,
    this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: IconButton(onPressed: onPressed, icon: Icon(Icons.check_box)),
        title: svg == null
            ? title
            : SvgPicture.asset(
                svg!,
                alignment: Alignment.topLeft,
                height: 50,
              ),
        trailing: trailing ?? Text(""),
      ),
    );
  }
}
