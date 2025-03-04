import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class AddLocatoinControllerAbstract extends GetxController {
  bool? isLocationEnabled;
  Rx<LatLng?> userLocation = Rx<LatLng?>(null);
  Rx<LatLng?> selectedLocation = Rx<LatLng?>(null);
  var markers = <Marker>[].obs;
  getUserLocation();
}

class AddLocationController extends AddLocatoinControllerAbstract {
  @override
  getUserLocation() async {
    LocationPermission permission;
    isLocationEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isLocationEnabled!) {
      return Get.snackbar("error", "turn gps");
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar("warning!", "you must enable location access");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Get.snackbar(
          "error!", "you must enable location access from settings");
    }
    final LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );
    Position position =
        await Geolocator.getCurrentPosition(locationSettings: locationSettings);
    userLocation.value = LatLng(position.altitude, position.longitude);
  }
}
