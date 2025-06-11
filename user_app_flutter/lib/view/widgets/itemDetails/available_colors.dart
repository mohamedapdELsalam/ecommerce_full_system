import 'package:ecommerceapp/controller/items/item_details_controller.dart';
import 'package:ecommerceapp/view/widgets/itemDetails/procuct_color_cirlce.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AvailableColors extends GetView<ItemsDetailsController> {
  const AvailableColors({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(controller.uniqueColors.length, (i) {
          var model = controller.uniqueColors[i];
          return ProductColorCircle(
            colorId: model.colorsId!,
            isSelected: controller.selectedColor == model.colorsId,
            color: Color(
                int.parse(model.colorsHexcode!.replaceFirst('#', '0xFF'))),
          );
        })
      ],
    );
  }
}
