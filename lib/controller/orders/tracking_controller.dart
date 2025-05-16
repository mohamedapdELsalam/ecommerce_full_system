import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/core/class/status_request.dart';
import 'package:ecommerceapp/core/functions/get_polyline.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/data/model/order_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

abstract class TrackingPositionControllerAbs extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  late StreamSubscription<Position> positionStream;
  OrderModel orderModel = OrderModel();
  List<Marker> markers = [];
  List<Polyline> polyLineList = [];
  MapController mapController = MapController();
  double? lat;
  double? lng;
  double? latDes;
  double? lngDes;
  Timer? timer;
  MyServices myServices = Get.find();
}

class TrackingPositionController extends TrackingPositionControllerAbs {
  LocationSettings locationSettings = LocationSettings(
    accuracy: LocationAccuracy.high,
  );

  initialData() {
    orderModel = Get.arguments["orderModel"];
    lat = orderModel.latitude;
    lng = orderModel.longitude;
  }

  getDeliveryLocation() async {
    // mapController.move(LatLng(position.latitude, position.longitude), 4);
    FirebaseFirestore.instance
        .collection("delivery")
        .doc("${orderModel.ordersId}")
        .snapshots()
        .listen((event) async {
      if (event.exists) {
        latDes = event.get("lat");
        lngDes = event.get("lng");
        markers[1] = Marker(
            point: LatLng(latDes!, lngDes!),
            child: Icon(Icons.delivery_dining));
        polyLineList = await getPolyline(lat, lng, latDes, lngDes);
        update();
      }
    });
  }

  addMarker() {
    markers.add(
      Marker(
        point: LatLng(orderModel.latitude!, orderModel.longitude!),
        child: Icon(Icons.location_pin),
      ),
    );
    markers.add(Marker(point: LatLng(0, 0), child: Icon(Icons.location_pin)));
    update();
  }

  @override
  void onInit() async {
    super.onInit();
    initialData();
    addMarker();
    getDeliveryLocation();
  }

  @override
  void onClose() {
    super.onClose();
    positionStream.cancel();
    timer!.cancel();
  }
}
