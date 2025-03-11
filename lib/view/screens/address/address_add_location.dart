import 'package:ecommerceapp/controller/address/addlocatoin_controller.dart';
import 'package:ecommerceapp/view/widgets/address/address_button.dart';
import 'package:ecommerceapp/view/widgets/address/address_map.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class AddressAddLocation extends StatelessWidget {
  const AddressAddLocation({super.key});

  @override
  Widget build(BuildContext context) {
    AddLocationController controller = Get.put(AddLocationController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Step 1 : choice your location",
          style: TextStyle(fontSize: 15),
        ),
      ),
      body: Stack(
        children: [
          GetBuilder<AddLocationController>(builder: (controller) {
            if (controller.selectedLocation != null) {
              return AddressMap();
            } else {
              return Center(child: (Text("loading....")));
            }
          }),
          Positioned(
              top: 50,
              left: 20,
              child: FloatingActionButton(
                onPressed: () {
                  controller.getUserLocation();
                },
                child: Icon(Icons.location_searching_outlined),
              )),
          Positioned(
              bottom: 5,
              right: 1,
              left: 1,
              child: AddressButton(
                  title: "confirm",
                  onPressed: () {
                    controller.goToStep2();
                  }))
        ],
      ),
    );
  }
}
