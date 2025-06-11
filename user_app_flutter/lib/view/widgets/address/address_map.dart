import 'package:ecommerceapp/controller/address/addlocatoin_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';

class AddressMap extends GetView<AddLocationController> {
  const AddressMap({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        onTap: (_, latLng) {
          controller.updateLocation(latLng);
        },
        initialCenter: controller.selectedLocation!,
        initialZoom: 13,
        minZoom: 6,
        maxZoom: 25,
        interactionOptions: const InteractionOptions(
          flags: InteractiveFlag.all &
              ~InteractiveFlag.rotate, // منع الدوران وتحسين السلاسة
        ), // منع الدوران وتحسين السلاسة
      ),
      children: [
        TileLayer(
          urlTemplate:
              "https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token=pk.eyJ1IjoibW9oYW1lZDc3NyIsImEiOiJjbTd3ZDl2cjAwNHZjMmtzODJycm9vNmVqIn0._3Hfl3BWuGG4cg07sUKbZQ",
          additionalOptions: {
            'access_token':
                'pk.eyJ1IjoibW9oYW1lZDc3NyIsImEiOiJjbTd3ZDl2cjAwNHZjMmtzODJycm9vNmVqIn0._3Hfl3BWuGG4cg07sUKbZQ',
            'id': 'mapbox/streets-v11', // ممكن تغير الستايل لو حابب
          },
        ),
        GetBuilder<AddLocationController>(builder: (controller) {
          return MarkerLayer(
            markers: controller.markers,
          );
        }),
      ],
    );
  }
}
