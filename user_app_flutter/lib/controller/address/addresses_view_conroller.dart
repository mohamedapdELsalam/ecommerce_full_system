import 'package:ecommerceapp/core/class/status_request.dart';
import 'package:ecommerceapp/core/functions/handlindStatusRequest.dart';
import 'package:ecommerceapp/data/data_source/remote/address_data.dart';
import 'package:ecommerceapp/data/model/address_model.dart';
import 'package:get/get.dart';

abstract class AddressesViewControllerAbstract extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  AddressData addressData = AddressData();
  List<AddressModel> addressesList = [];

  Future<void> getAddresses();
  Future<void> deleteAddress(int addressId);
}

class AddressesViewController extends AddressesViewControllerAbstract {
  @override
  void onInit() {
    super.onInit();
    getAddresses();
  }

  @override
  Future<void> getAddresses() async {
    var response = await addressData.getAddressesRequest();
    statusRequest = StatusRequest.loading;
    update();
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        List data = response["data"];
        addressesList.addAll(data.map((e) => AddressModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  Future<void> deleteAddress(addressId) async {
    addressesList.removeWhere((e) => e.addressId == addressId);
    update();
    var response = await addressData.deleteAddress(addressId);
    if (response["status"] == "success") {
      print("---------------- deleted successfully");
      Get.showSnackbar(GetSnackBar(
        duration: Duration(seconds: 1),
        title: "address deleted successfully",
        message: "done",
      ));
    } else {
      print("---------------- deleted error");
    }
    if (addressesList.isEmpty) {
      statusRequest = StatusRequest.failure;
    }
    update();
  }
}
