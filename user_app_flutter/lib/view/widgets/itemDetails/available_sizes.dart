import 'package:ecommerceapp/controller/items/item_details_controller.dart';
import 'package:ecommerceapp/view/widgets/itemDetails/product_size.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AvailableSizes extends GetView<ItemsDetailsController> {
  const AvailableSizes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      ...List.generate(controller.availableSizes.length, (i) {
        int sizeId = controller.availableSizes[i];
        var model = controller.itemVariants.firstWhere(
          (v) => v.sizesId == sizeId,
          orElse: () => controller.itemVariants[0],
        );
        return ProductSize(
          size: model.sizesLabel!,
          sizeId: model.sizesId!,
          isSelected: controller.selectedSize == model.sizesId,
        );
      })
    ]);
  }
}
