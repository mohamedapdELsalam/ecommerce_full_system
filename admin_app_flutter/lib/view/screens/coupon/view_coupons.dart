import 'package:adminapp/controller/coupons/view_coupons_controller.dart';
import 'package:adminapp/core/class/handlind_status_request.dart';
import 'package:adminapp/view/widgets/coupons/view_coupons/add_coupons.dart';
import 'package:adminapp/view/widgets/coupons/view_coupons/coupons_table.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewCoupons extends StatelessWidget {
  const ViewCoupons({super.key});

  @override
  Widget build(BuildContext context) {
    // ViewCouponsController controller =
    Get.put(ViewCouponsController());
    return Scaffold(
      appBar: AppBar(title: Text("coupons")),
      body: GetBuilder<ViewCouponsController>(
        builder:
            (controller) => HandlingStatusRequest(
              statusRequest: controller.statusRequest,
              widget: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      TitleAndAddCoupon(),
                      LayoutBuilder(
                        builder: (context, constrains) {
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                minWidth: constrains.maxWidth,
                              ),

                              child: CouponsTable(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              controller: controller,
            ),
      ),
    );
  }
}
