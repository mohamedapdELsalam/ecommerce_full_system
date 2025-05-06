import 'package:adminapp/core/class/status_request.dart';
import 'package:adminapp/core/functions/handling_status_request.dart';
import 'package:adminapp/data/data_source/remote/products/view_product_data.dart';
import 'package:adminapp/data/model/product_model.dart';
import 'package:get/get.dart';

abstract class ProductsViewControllerAbstract extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  ProductViewData productViewData = ProductViewData();
  List<ProductModel> products = [];
  Future<void> getProducts();
  Future<void> deleteProduct(int productId, String imageName);
}

class ProductsViewController extends ProductsViewControllerAbstract {
  @override
  void onInit() async {
    super.onInit();
    await getProducts();
    // await getCategories();
  }

  @override
  getProducts() async {
    products.clear();
    print("----------- iam alive");
    statusRequest = StatusRequest.loading;
    update();
    var response = await productViewData.getProducts();
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        List data = response["data"];
        products.addAll(data.map((e) => ProductModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  deleteProduct(productId, imageName) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await productViewData.deleteProduct(productId, imageName);
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        await getProducts();
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
