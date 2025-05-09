import 'package:adminapp/core/class/status_request.dart';
import 'package:adminapp/core/functions/handling_status_request.dart';
import 'package:adminapp/core/shared/alert_dialog.dart';
import 'package:adminapp/data/data_source/remote/items/view_items_data.dart';
import 'package:adminapp/data/model/item_model.dart';
import 'package:get/get.dart';

abstract class ItemsViewControllerAbstract extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  ItemViewData itemsViewData = ItemViewData();
  List<ItemModel> items = [];
  Future<void> getItems();
  Future<void> deleteItem(int productId, String imageName);
}

class ItemsViewController extends ItemsViewControllerAbstract {
  @override
  void onInit() async {
    super.onInit();
    await getItems();
  }

  @override
  getItems() async {
    items.clear();
    print("----------- iam alive");
    statusRequest = StatusRequest.loading;
    update();
    var response = await itemsViewData.getItems();
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        List data = response["data"];
        items.addAll(data.map((e) => ItemModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  onLongPress(productId, imageName) {
    showAlertDialog(
      content: "Are you sure you want to delete this ?",
      onCancel: () {
        Get.back();
      },
      onConfirm: () async {
        Get.back();
        await deleteItem(productId, imageName);
      },

      title: "warn",
    );
  }

  @override
  Future<void> deleteItem(productId, imageName) async {
    items.removeWhere((e) => e.itemsId == productId);
    update();
    // statusRequest = StatusRequest.loading;
    // update();
    var response = await itemsViewData.deleteItem(productId, imageName);
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        // await getProducts();
        Get.showSnackbar(
          GetSnackBar(
            duration: Duration(seconds: 1),
            title: "done",
            message: "category deleted successfully",
          ),
        );
      } else {
        statusRequest = StatusRequest.failure;
        Get.showSnackbar(
          GetSnackBar(
            title: "fail",
            message: "category Not deleted successfully",
          ),
        );
      }
    }
    update();
  }

  void resetStatus() {
    statusRequest = StatusRequest.none;
    update();
  }
}
