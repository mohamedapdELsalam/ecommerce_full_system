import 'package:ecommerceapp/core/constants/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

abstract class AddLocationControllerAbstract extends GetxController {
  LatLng? selectedLocation;
  List<Marker> markers = [];
  Future<void> checkLocationPerm();
  Future<void> getUserLocation();
  Future<void> updateLocation(LatLng latlng);
  void addMark(LatLng latlng);
  void goToStep2();
}

class AddLocationController extends AddLocationControllerAbstract {
  final mapController = MapController();

  @override
  void onInit() {
    super.onInit();
    getUserLocation();
  }

  @override
  Future<void> getUserLocation() async {
    await checkLocationPerm();

    final LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.best,
      distanceFilter: 100,
    );
    Position position =
        await Geolocator.getCurrentPosition(locationSettings: locationSettings);
    selectedLocation = LatLng(position.latitude, position.longitude);
    updateLocation(selectedLocation!);
  }

  @override
  addMark(latlng) {
    markers.clear();
    markers.add(Marker(
        point: latlng,
        child: Icon(
          Icons.location_on,
          color: Colors.red,
          size: 30,
        )));
    update();
  }

  @override
  Future<void> checkLocationPerm() async {
    bool isLocationEnabled;
    LocationPermission permission;
    isLocationEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isLocationEnabled) {
      print("error : gps not enabled");
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print("warning :you must enable location access");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      print("warning :you must enable location access from settings");
    }
  }

  @override
  Future<void> updateLocation(latlng) async {
    selectedLocation = LatLng(latlng.latitude, latlng.longitude);
    addMark(selectedLocation!);
  }

  @override
  void goToStep2() {
    Get.offNamed(AppRoutes.addAddressStep2, arguments: {
      "lat": selectedLocation!.latitude,
      "long": selectedLocation!.longitude
    });
  }
}
