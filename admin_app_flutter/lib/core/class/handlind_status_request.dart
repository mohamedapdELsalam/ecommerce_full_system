import 'package:adminapp/core/class/status_request.dart';
import 'package:adminapp/core/constants/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class HandlingStatusRequestWithData extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingStatusRequestWithData({
    super.key,
    required this.statusRequest,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.none
        ? widget
        : statusRequest == StatusRequest.loading
        ? Center(
          child: Lottie.asset(
            LottiesAssets.loadingCyan,
            width: 150,
            height: 150,
          ),
        )
        : statusRequest == StatusRequest.failure
        ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                LottiesAssets.noDataText,
                repeat: false,
                width: 100,
                height: 100,
              ),
              Text("No Data"),
              // TextButton(
              //   child: Text("try again"),
              //   onPressed: () {
              //     Get.back();
              //   },
              // )
            ],
          ),
        )
        : statusRequest == StatusRequest.serverFailure
        ? Center(
          child: Lottie.asset(LottiesAssets.unknown, width: 200, height: 200),
        )
        : statusRequest == StatusRequest.success
        ? widget
        : Center(
          child: Column(
            children: [
              Lottie.asset(LottiesAssets.offline),
              Text("no internet "),
              TextButton(
                child: Text("try again"),
                onPressed: () {
                  Get.back();
                },
              ),
            ],
          ),
        );
  }
}

class HandlingStatusRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  final controller;
  const HandlingStatusRequest({
    super.key,
    required this.statusRequest,
    required this.widget,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.none
        ? widget
        : statusRequest == StatusRequest.loading
        ? Center(
          child: Lottie.asset(
            LottiesAssets.loadingCyan,
            width: 150,
            height: 150,
          ),
        )
        : statusRequest == StatusRequest.serverFailure
        ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(LottiesAssets.unknown, width: 200, height: 200),
              TextButton(
                child: Text("back"),
                onPressed: () {
                  controller.resetStatus();
                },
              ),
            ],
          ),
        )
        : statusRequest == StatusRequest.success
        ? widget
        : statusRequest == StatusRequest.failure
        ? Center(
          child: Column(
            children: [
              Lottie.asset(LottiesAssets.noDataText),
              TextButton(
                onPressed: () {
                  statusRequest == StatusRequest.none;
                  controller.resetStatus();
                },
                child: Text("back"),
              ),
            ],
          ),
        )
        : Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(LottiesAssets.unknown),
              TextButton(
                child: Text("back"),
                onPressed: () {
                  controller.resetStatus();
                },
              ),
            ],
          ),
        );
  }
}

