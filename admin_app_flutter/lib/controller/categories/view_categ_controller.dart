import 'package:adminapp/core/class/status_request.dart';
import 'package:adminapp/core/functions/handling_status_request.dart';
import 'package:adminapp/core/shared/alert_dialog.dart';
import 'package:adminapp/data/data_source/remote/categories/categ_view_data.dart';
import 'package:adminapp/data/model/category_model.dart';
import 'package:get/get.dart';

abstract class CategoriesViewControllerAbstract extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  CategoriesViewData categViewData = CategoriesViewData();
  List<CategoryModel> categories = [];
  Future<void> getCategories();
  Future<void> deleteCategory(int categoryId, String imageName);
}

class CategoriesController extends CategoriesViewControllerAbstract {
  @override
  void onInit() {
    super.onInit();
    // await getCategories();
  }

  @override
  void onReady() async {
    super.onReady();
    await getCategories();
  }

  @override
  getCategories() async {
    categories.clear();
    print("----------- iam alive");
    statusRequest = StatusRequest.loading;
    update();
    var response = await categViewData.getCategories();
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        List data = response["data"];
        categories.addAll(data.map((e) => CategoryModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  onLongPress(categoryId, imageName) {
    showAlertDialog(
      onConfirm: () {
        deleteCategory(categoryId, imageName);
      },
      title: "warn",
      content: "do you agreed !!",
    );
  }

  @override
  deleteCategory(categoryId, imageName) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await categViewData.deleteCategory(categoryId, imageName);
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        await getCategories();
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
