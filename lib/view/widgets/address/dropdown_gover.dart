import 'package:dropdown_search/dropdown_search.dart';
import 'package:ecommerceapp/controller/address/address_step2_controller.dart';
import 'package:ecommerceapp/data/model/govers_model.dart';
import 'package:flutter/material.dart';

class DropdownGover extends StatelessWidget {
  const DropdownGover({
    super.key,
    required this.controller,
  });

  final AddressStep2Controller controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: DropdownSearch<GoverModel>(
        decoratorProps: DropDownDecoratorProps(
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
        ),
        compareFn: (item1, item2) =>
            item1.governoratesId == item2.governoratesId,
        items: (String filter, LoadProps? props) {
          return controller.governorates;
        },
        itemAsString: (GoverModel? gov) => gov?.governorateNameAr ?? "",
        dropdownBuilder: (context, selectedItem) =>
            Text(selectedItem?.governorateNameAr ?? "اختر المحافظة"),
        onChanged: (GoverModel? selectedGov) {
          if (selectedGov != null) {
            controller.ongoverChanged(selectedGov);
          }
        },
        popupProps: PopupProps.menu(showSearchBox: true),
      ),
    );
  }
}
