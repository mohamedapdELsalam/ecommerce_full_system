import 'package:ecommerceapp/controller/orders/tracking_controller.dart';
import 'package:ecommerceapp/core/class/handlind_status_request.dart';
import 'package:ecommerceapp/core/constants/api_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class OrderTracking extends StatelessWidget {
  const OrderTracking({super.key});

  @override
  Widget build(BuildContext context) {
    // TrackingPositionController controller =
    Get.put(TrackingPositionController());
    return GetBuilder<TrackingPositionController>(
      builder: (controller) => HandlingStatusRequest(
        statusRequest: controller.statusRequest,
        widget: Stack(
          children: [
            SizedBox(
              child: FlutterMap(
                mapController: controller.mapController,
                options: MapOptions(
                  initialCenter: LatLng(
                    controller.orderModel.latitude!,
                    controller.orderModel.longitude!,
                  ),
                  initialZoom: 13,
                  minZoom: 6,
                  maxZoom: 25,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        "https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token=${ApiKeys.mapBoxToken}",
                    additionalOptions: {
                      'access_token': ApiKeys.mapBoxToken,
                      'id': 'mapbox/streets-v11',
                    },
                  ),
                  MarkerLayer(markers: controller.markers),
                  PolylineLayer(polylines: controller.polyLineList),
                ],
              ),
            ),
          ],
        ),
        controller: controller,
      ),
    );
  }
}
