import 'package:dropdown_search/dropdown_search.dart';
import 'package:ecommerceapp/core/class/status_request.dart';
import 'package:ecommerceapp/core/functions/handlindStatusRequest.dart';
import 'package:ecommerceapp/data/data_source/remote/address_data.dart';
import 'package:ecommerceapp/data/model/city_model.dart';
import 'package:ecommerceapp/data/model/govers_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AddressStep2ControllerAbstract extends GetxController {
  var lat;
  var long;
  GoverModel? selectedGover;
  CityModel? selectedCity;
  final dropDownKey = GlobalKey<DropdownSearchState>();
  TextEditingController streetCtrl = TextEditingController();
  TextEditingController addressNameCtrl = TextEditingController();
  ongoverChanged(GoverModel selectedGov);
  addAddress();

  StatusRequest statusRequest = StatusRequest.none;
  AddressData addressStep2Data = AddressData();

  List<GoverModel> governorates = [];
  List<CityModel> cities = [];
  Future<void> getGovernorates();
  Future<void> getCities(String cityId);
}

class AddressStep2Controller extends AddressStep2ControllerAbstract {
  @override
  void onInit() async {
    super.onInit();
    await getGovernorates();
    lat = Get.arguments["lat"];
    long = Get.arguments["long"];
  }

  @override
  void onClose() {
    streetCtrl.dispose();
    addressNameCtrl.dispose();
    super.onClose();
  }

  @override
  Future<void> getCities(String cityId) async {
    var response = await addressStep2Data.getCitiesRequest(cityId);
    statusRequest = StatusRequest.loading;
    update();
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        List data = response["data"];
        cities.addAll(data.map((e) => CityModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  Future<void> getGovernorates() async {
    var response = await addressStep2Data.getGoversRequest();
    statusRequest = StatusRequest.loading;
    update();
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        List data = response["data"];
        governorates.addAll(data.map((e) => GoverModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  ongoverChanged(selectedGov) {
    selectedGover = selectedGov;
    cities.clear();
    getCities(selectedGov.governoratesId!.toString());
    // selectedGover = selectedGov.!;
    update();
  }

  @override
  addAddress() async {
    if (selectedCity == null || selectedCity == null) {
      print("======================= aha ===================");
      return;
    }
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressStep2Data.addAddressRequest(selectedGover!,
        selectedCity!, addressNameCtrl.text, streetCtrl.text, long, lat);
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        print("-------------------  done  --------------");
        Get.back();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }
}
