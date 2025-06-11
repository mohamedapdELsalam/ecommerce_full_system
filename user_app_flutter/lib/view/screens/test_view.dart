import 'package:ecommerceapp/controller/test_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            MaterialButton(
                onPressed: () {
                  // showDialogStatusRequest(context, controller.statusRequest);
                },
                child: Text("do something"))
          ],
        ),
      ),
    ));
  }
}
