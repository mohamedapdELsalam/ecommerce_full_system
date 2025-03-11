import 'package:ecommerceapp/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckPointModel {
  final Widget title;
  final Widget price;
  CheckPointModel({required this.title, required this.price});
}

CartController controller = Get.find();

TextStyle titleStyle = TextStyle();
TextStyle totalStyle =
    TextStyle(color: const Color.fromARGB(255, 200, 183, 30), fontSize: 20);

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (controller) {
        List<CheckPointModel> checkPointsList = [
          CheckPointModel(
              title: Text("cart total : ", style: titleStyle),
              price: Text("${controller.cartTotal} \$")),
          CheckPointModel(
              title: Text("delivery : ", style: titleStyle),
              price: Text("20 \$")),
          CheckPointModel(
              title: Text("tax : ", style: titleStyle), price: Text("20 \$")),
          if (controller.couponModel != null)
            CheckPointModel(
                title: Text("coupon discount", style: titleStyle),
                price: Text(
                  "${controller.couponModel!.couponDiscount} %",
                  style: titleStyle,
                )),
          CheckPointModel(
              title: Text("total", style: totalStyle),
              price: Text(
                "${controller.calculateCartTotal() + 40} \$",
                style: totalStyle,
              )),
        ];

        return Column(
          children: List.generate(checkPointsList.length + 1, (index) {
            if (index == checkPointsList.length) {
              return Divider();
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                checkPointsList[index].title,
                checkPointsList[index].price,
              ],
            );
          }),
        );
      },
    );
  }
}
