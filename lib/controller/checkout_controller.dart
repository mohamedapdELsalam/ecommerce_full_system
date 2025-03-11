import 'package:ecommerceapp/controller/address/addresses_view_conroller.dart';
import 'package:ecommerceapp/data/model/address_model.dart';
import 'package:get/get.dart';

abstract class CheckoutControllerAbstract extends GetxController {
  int currentStep = 0;
  void nextStep();
  void changeStep(int val);
  AddressesViewController addressController =
      Get.put(AddressesViewController());
  List<AddressModel>? AddressesList;
}

class CheckoutController extends CheckoutControllerAbstract {
  @override
  void onInit() {
    super.onInit();
    AddressesList = addressController.addressesList;
  }

  @override
  nextStep() {
    currentStep++;
    update();
  }

  @override
  changeStep(val) {
    currentStep = val;
    update();
  }
}
