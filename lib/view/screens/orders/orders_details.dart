
import 'package:adminapp/controller/orders/order_details_controller.dart';
import 'package:adminapp/core/class/handlind_status_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderDetailsController());
    return Scaffold(
      appBar: AppBar(title: Text("order details")),
      body: Container(
        child: GetBuilder<OrderDetailsController>(
            builder: (controller) => HandlingStatusRequest(
               controller: controller,
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: EdgeInsets.all(5),
                    child: ListView(
                      children: [
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Table(
                                  border: TableBorder.all(
                                      color:
                                          const Color.fromARGB(56, 42, 41, 41),
                                      borderRadius: BorderRadius.circular(10)),
                                  children: [
                                    TableRow(children: [
                                      Text(
                                        "item",
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary),
                                      ),
                                      Text(
                                        "quantity",
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary),
                                      ),
                                      Text(
                                        "price",
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary),
                                      ),
                                      Text(
                                        "total price",
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary),
                                      ),
                                    ]),
                                    ...List.generate(
                                        controller.orderDetails.length,
                                        (index) => TableRow(children: [
                                              Text(
                                                  "${controller.orderDetails[index].itemsNameEn}",
                                                  textAlign: TextAlign.center),
                                              Text(
                                                  "${controller.orderDetails[index].count}",
                                                  textAlign: TextAlign.center),
                                              Text(
                                                  "${controller.orderDetails[index].finalPrice}",
                                                  textAlign: TextAlign.center),
                                              Text(
                                                  "${controller.orderDetails[index].totalPrice}",
                                                  textAlign: TextAlign.center),
                                            ])),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Text("----------------------------"),
                                SizedBox(height: 5),
                                Text(
                                  "total Price : ${controller.orderModel!.ordersTotalPrice} \$",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ),
                        if (controller.orderModel!.ordersDeliveryType == 0)
                          Card(
                            child: Column(
                              children: [
                                ListTile(
                                    title: Text(
                                      "${controller.orderModel!.name}",
                                    ),
                                    subtitle: Text(
                                        "${controller.orderModel!.cityEn} /${controller.orderModel!.goverEn} "),
                                    trailing: Icon(Icons.location_pin)),
                                if (controller.selectedLocation != null)
                                  Container(
                                    height: 200,
                                    width: double.infinity,
                                    child: FlutterMap(
                                      options: MapOptions(
                                        initialCenter:
                                            controller.selectedLocation!,
                                        initialZoom: 13,
                                        minZoom: 6,
                                        maxZoom: 25,
                                      ),
                                      children: [
                                        TileLayer(
                                          urlTemplate:
                                              "https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token=pk.eyJ1IjoibW9oYW1lZDc3NyIsImEiOiJjbTd3ZDl2cjAwNHZjMmtzODJycm9vNmVqIn0._3Hfl3BWuGG4cg07sUKbZQ",
                                          additionalOptions: {
                                            'access_token':
                                                'pk.eyJ1IjoibW9oYW1lZDc3NyIsImEiOiJjbTd3ZDl2cjAwNHZjMmtzODJycm9vNmVqIn0._3Hfl3BWuGG4cg07sUKbZQ',
                                            'id': 'mapbox/streets-v11',
                                          },
                                        ),
                                        MarkerLayer(
                                          markers: controller.markers,
                                        )
                                      ],
                                    ),
                                  )
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                )),
      ),
    );
  }
}
