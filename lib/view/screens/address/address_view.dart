import 'package:ecommerceapp/controller/address/addresses_view_conroller.dart';
import 'package:ecommerceapp/core/class/handlind_status_request.dart';
import 'package:ecommerceapp/core/constants/app_routes.dart';
import 'package:ecommerceapp/core/constants/lang_keys.dart';
import 'package:ecommerceapp/view/widgets/cart/cart_remove_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddressesViewController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.offNamed(AppRoutes.addAddressLocation);
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text(LangKeys.addresses.tr),
      ),
      body: GetBuilder<AddressesViewController>(
          builder: (controller) => HandlingStatusRequest(
              controller: controller,
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  itemCount: controller.addressesList.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Card(
                          child: ListTile(
                            title: Text(
                                "${controller.addressesList[index].cityAr}"),
                            subtitle: Text(
                                "${controller.addressesList[index].goverAr}"),
                            trailing:
                                Text("${controller.addressesList[index].name}"),
                          ),
                        ),
                        Positioned(
                          top: -10,
                          right: -7,
                          child: CartRemoveIcon(
                              cartItem: controller.addressesList,
                              onConfirm: () {
                                controller.deleteAddress(
                                    controller.addressesList[index].addressId!);
                                Navigator.pop(context);
                              },
                              title: "warn",
                              content: Text(
                                "do you agreed to remove ${controller.addressesList[index].goverEn} from address",
                              )),
                        ),
                      ],
                    );
                  }))),
    );
  }
}
