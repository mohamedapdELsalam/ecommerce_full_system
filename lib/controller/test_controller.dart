import 'package:ecommerceapp/core/class/crud.dart';
import 'package:ecommerceapp/core/class/status_request.dart';
import 'package:ecommerceapp/core/functions/handlindStatusRequest.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/data_source/remote/test_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class TestControllerAbstract extends GetxController {
  get() {}
  Crud crud = Crud();
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController labelCtrl = TextEditingController();
  MyServices services = Get.find();
  TestData testData = TestData(Get.find());
  List data = [];
  late StatusRequest statusRequest = StatusRequest.none;
}

class TestController extends TestControllerAbstract {
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await testData.getData();
    statusRequest = handlindStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        data.addAll(response['data'] ?? [""]);
        print("success");
      } else if (response["status"] == "fail") {
        print("api is good but return fail  ");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() async {
    await getData();
    super.onInit();
  }
}
