import 'package:adminapp/controller/coupons/view_coupons_controller.dart';
import 'package:adminapp/view/widgets/coupons/view_coupons/data_cell_child.dart';
import 'package:adminapp/view/widgets/coupons/view_coupons/data_column_label.dart';
import 'package:adminapp/view/widgets/coupons/view_coupons/usage_data_cell.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CouponsTable extends GetView<ViewCouponsController> {
  const CouponsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      headingRowHeight: 30,
      columnSpacing: 10,
      headingRowColor: WidgetStatePropertyAll(
        const Color.fromARGB(255, 202, 198, 198),
      ),

      // dataRowColor: WidgetStatePropertyAll(Colors.grey),
      columns: [
        DataColumn(label: DataColumnLabel(title: "code")),
        DataColumn(label: DataColumnLabel(title: "count")),
        DataColumn(label: DataColumnLabel(title: "discount")),
        DataColumn(label: DataColumnLabel(title: "expiration")),
        DataColumn(label: DataColumnLabel(title: "usage")),
      ],
      rows:
          controller.coupons
              .map(
                (m) => DataRow(
                  cells: [
                    DataCell(DataCellChild(text: m.couponCode!)),
                    DataCell(DataCellChild(text: m.couponCount.toString())),
                    DataCell(DataCellChild(text: m.couponDiscount!.toString())),
                    DataCell(
                      DataCellChild(
                        text: m.couponExpiredDate!.split(' ').first,
                      ),
                    ),

                    DataCell(UsageDataCell(couponId: m.couponId!)),
                  ],
                ),
              )
              .toList(),
    );
  }
}
