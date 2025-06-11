import 'package:ecommerceapp/controller/items/item_details_controller.dart';
import 'package:ecommerceapp/core/class/handlind_status_request.dart';
import 'package:ecommerceapp/core/extensions/context_extensions.dart';
import 'package:ecommerceapp/view/widgets/itemDetails/available_colors.dart';
import 'package:ecommerceapp/view/widgets/itemDetails/available_sizes.dart';
import 'package:ecommerceapp/view/widgets/itemDetails/procuct_color_cirlce.dart';
import 'package:ecommerceapp/view/widgets/itemDetails/product_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AvailableColorsAndSizes extends GetView<ItemsDetailsController> {
  const AvailableColorsAndSizes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemsDetailsController>(
        builder: (controller) => HandlingStatusRequest(
            statusRequest: controller.statusRequest,
            widget: controller.itemVariants.isNotEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 0),
                        child: Text("Colors",
                            style: context.textTheme.titleMedium!
                                .copyWith(color: context.primaryColor)),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        child: AvailableColors(),
                      ),
                      if (controller.selectedColor != null)
                        Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: Text("Sizes",
                                textAlign: TextAlign.start,
                                style: context.textTheme.titleMedium!
                                    .copyWith(color: context.primaryColor))),
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        child: AvailableSizes(),
                      ),
                    ],
                  )
                : Text(""),
            controller: controller));
  }
}
