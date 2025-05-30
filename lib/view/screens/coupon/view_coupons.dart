import 'package:adminapp/controller/coupons/view_coupons_controller.dart';
import 'package:adminapp/core/class/handlind_status_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewCoupons extends StatelessWidget {
  const ViewCoupons({super.key});

  @override
  Widget build(BuildContext context) {
    ViewCouponsController controller = Get.put(ViewCouponsController());
    return Scaffold(
      appBar: AppBar(title: Text("Coupons")),
      body: GetBuilder<ViewCouponsController>(
        builder:
            (controller) => HandlingStatusRequest(
              statusRequest: controller.statusRequest,
              widget: DataTable(
                columns: [
                  DataColumn(label: SizedBox(width: 100, child: Text("code",textAlign: TextAlign.center,))),
                  DataColumn(label: SizedBox(width: 100,child: Text("discount",textAlign: TextAlign.center,))),
                  DataColumn(label: SizedBox(width: 130,child: Text("expiration",textAlign: TextAlign.center,))),
                  DataColumn(label: SizedBox(width: 100,child: Text("usage",textAlign: TextAlign.center,))),
                ],
                rows:
                    controller.coupons
                        .map(
                          (m) => DataRow(
                            cells: [
                              DataCell(Center(child: Text(m.couponCode!,textAlign: TextAlign.center,))),
                              DataCell(
                                Center(child: Text("${m.couponDiscount}",textAlign: TextAlign.center,)),
                              ),
                              DataCell(
                                Center(child: Text("${m.couponExpiredDate}",textAlign: TextAlign.center,)),
                              ),
                              DataCell(
                                Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.edit),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon((Icons.delete)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                        .toList(),
              ),
              controller: controller,
            ),
      ),
    );
  }
}
