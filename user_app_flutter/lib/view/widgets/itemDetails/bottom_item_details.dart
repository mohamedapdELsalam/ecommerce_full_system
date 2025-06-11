import 'package:ecommerceapp/controller/items/item_details_controller.dart';
import 'package:ecommerceapp/core/class/handlind_status_request.dart';
import 'package:ecommerceapp/core/extensions/context_extensions.dart';
import 'package:ecommerceapp/view/widgets/itemDetails/procuct_color_cirlce.dart';
import 'package:ecommerceapp/view/widgets/itemDetails/product_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomItemDetails extends GetView<ItemsDetailsController> {
  const BottomItemDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemsDetailsController>(
        builder: (controller) => HandlingStatusRequest(
            statusRequest: controller.statusRequest,
            widget: Column(
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
                  child: Row(
                    children: [
                      ...List.generate(controller.uniqueColors.length, (i) {
                        var model = controller.uniqueColors[i];
                        return GetBuilder<ItemsDetailsController>(
                          builder: (controller) => ProductColorCircle(
                            colorId: model.colorsId!,
                            isSelected:
                                controller.selectedColor == model.colorsId,
                            color: Color(int.parse(model.colorsHexcode!
                                .replaceFirst('#', '0xFF'))),
                          ),
                        );
                      })
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: Text("Sizes",
                        textAlign: TextAlign.start,
                        style: context.textTheme.titleMedium!
                            .copyWith(color: context.primaryColor))),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Row(children: [
                    ...List.generate(
                      controller.availableSizes.length,
                      (i) => ProductSize(
                        size: controller.itemVariants[i].sizesLabel!,
                        isSelected: true,
                      ),
                    )
                  ]),
                ),
              ],
            ),
            controller: controller));
  }
}
