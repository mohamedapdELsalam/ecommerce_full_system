import 'package:ecommerceapp/controller/address/address_step2_controller.dart';
import 'package:ecommerceapp/core/constants/lang_keys.dart';
import 'package:ecommerceapp/view/widgets/address/address_button.dart';
import 'package:ecommerceapp/view/widgets/address/address_textform.dart';
import 'package:ecommerceapp/view/widgets/address/dropdown_city.dart';
import 'package:ecommerceapp/view/widgets/address/dropdown_gover.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/instance_manager.dart';

class AddAddressStep2 extends StatelessWidget {
  const AddAddressStep2({super.key});

  @override
  Widget build(BuildContext context) {
    AddressStep2Controller controller = Get.put(AddressStep2Controller());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LangKeys.choosingLocationTitle2.tr,
          style: context.textTheme.bodyMedium,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: ListView(children: [
            AddressTextForm(
                controller: controller.addressNameCtrl,
                hint: LangKeys.addressName.tr),
            DropdownGover(controller: controller),
            DropdownCity(controller: controller),
            AddressTextForm(
                controller: controller.streetCtrl,
                hint: LangKeys.streetName.tr),
            AddressButton(
                onPressed: () {
                  controller.addAddress();
                },
                title: LangKeys.add.tr)
          ]),
        ),
      ),
    );
  }
}
