import 'package:adminapp/controller/items/add_item_controller.dart';
import 'package:adminapp/core/class/handlind_status_request.dart';
import 'package:adminapp/core/shared/main_global_button.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddProductButton extends StatelessWidget {
  const AddProductButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddItemController>(
      builder:
          (controller) => HandlingStatusRequest(
            statusRequest: controller.statusRequest,
            widget: GlobalButton(
              onPressed: () {
                controller.addItem();
              },
              title: "Add Product",
            ),
            controller: controller,
          ),
    );
  }
}
