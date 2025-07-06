import 'package:adminapp/controller/items/edit_item_controller.dart';
import 'package:adminapp/core/class/status_request.dart';
import 'package:adminapp/core/class/variant_input.dart';
import 'package:adminapp/core/functions/handling_status_request.dart';
import 'package:adminapp/data/data_source/remote/items/add_item_data.dart';
import 'package:adminapp/data/data_source/remote/items/edit_item_data.dart';
import 'package:adminapp/data/model/color_model.dart';
import 'package:adminapp/data/model/item_model.dart';
import 'package:adminapp/data/model/item_variant.dart';
import 'package:get/get.dart';

class VariantHandler {
  VariantHandler();

  AddItemData addItemData = AddItemData();
  EditItemData editItemData = EditItemData();
  final EditItemController controller = Get.find();

  List<int?> getDeletedVariants() {
    return controller.originalVariants
        .where((o) => !controller.variantInputs.any((i) => i.id == o.stockId))
        .map((e) => e.stockId)
        .toList();
  }

  List<Map> getEditedVariants() {
    return controller.variantInputs
        .where((v) {
          if (v.id == null) return false;
          final original = controller.originalVariants.firstWhereOrNull(
            (o) => o.stockId == v.id,
          );
          if (original == null) return false;

          return v.hasChangedComparedTo(original);
        })
        .map(
          (v) => {
            "variant_id": v.id,
            "item_color": v.colorId,
            "item_size": v.sizeId,
            "variant_price": v.priceController.text,
            "variant_count": v.countController.text,
            "variant_discount": v.discountCtrl.text,
          },
        )
        .toList();
  }

  List<Map> getNewVariants() {
    return controller.variantInputs
        .where((v) => v.id == null)
        .map(
          (v) => {
            "variant_id": v.id,
            "item_color": v.colorId,
            "item_size": v.sizeId,
            "variant_price": v.priceController.text,
            "variant_count": v.countController.text,
            "variant_discount": v.discountCtrl.text,
          },
        )
        .toList();
  }

  Future<void> getColors() async {
    controller.statusRequest = StatusRequest.loading;
    controller.update();
    var response = await addItemData.getColors();
    controller.statusRequest = handlingStatusRequest(response);
    if (controller.statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        List data = response["data"];
        controller.colors.addAll(data.map((e) => ColorModel.fromJson(e)));
      } else {
        controller.statusRequest = StatusRequest.failure;
      }
    } else {
      print("error 404 hahaha");
    }
    controller.update();
  }

  Future<void> getSizes() async {
    controller.statusRequest = StatusRequest.loading;
    controller.update();
    var response = await addItemData.getSizes();
    controller.statusRequest = handlingStatusRequest(response);
    if (controller.statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        controller.sizes = response["data"];
      } else {
        controller.statusRequest = StatusRequest.failure;
      }
    } else {
      print("error 404 hahaha");
    }
    controller.update();
  }

  Future<void> getProductVariants(ItemModel item) async {
    controller.statusRequest = StatusRequest.loading;
    controller.update();
    var response = await editItemData.getProcutVariants(item.itemsId!);
    controller.statusRequest = handlingStatusRequest(response);
    if (controller.statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        List data = response["data"];
        controller.originalVariants.addAll(
          data.map((e) => ItemVariantsModel.fromJson(e)),
        );
        controller.variantInputs =
            controller.originalVariants
                .map((e) => VariantInput.fromModel(e))
                .toList();
      } else {
        controller.statusRequest = StatusRequest.failure;
      }
    } else {
      print("error 404 hahaha");
    }
    controller.update();
  }
}
