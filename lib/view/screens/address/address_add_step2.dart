import 'package:ecommerceapp/controller/address/address_step2_controller.dart';
import 'package:ecommerceapp/view/widgets/address/address_button.dart';
import 'package:ecommerceapp/view/widgets/address/address_textform.dart';
import 'package:ecommerceapp/view/widgets/address/dropdown_city.dart';
import 'package:ecommerceapp/view/widgets/address/dropdown_gover.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

class AddAddressStep2 extends StatelessWidget {
  const AddAddressStep2({super.key});

  @override
  Widget build(BuildContext context) {
    AddressStep2Controller controller = Get.put(AddressStep2Controller());
    return Scaffold(
      appBar: AppBar(
        title: Text("step 2 : add your address"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: ListView(children: [
            AddressTextForm(
                controller: controller.addressNameCtrl, hint: " اسم المكان"),
            DropdownGover(controller: controller),
            DropdownCity(controller: controller),
            AddressTextForm(
                controller: controller.streetCtrl, hint: " اسم الشارع"),
            AddressButton(
                onPressed: () {
                  controller.addAddress();
                },
                title: "Add")
          ]),
        ),
      ),
    );
  }
}
