import 'package:dropdown_search/dropdown_search.dart';
import 'package:ecommerceapp/controller/address/address_step2_controller.dart';
import 'package:ecommerceapp/data/model/city_model.dart';
import 'package:flutter/material.dart';

class DropdownCity extends StatelessWidget {
  const DropdownCity({
    super.key,
    required this.controller,
  });

  final AddressStep2Controller controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: DropdownSearch<CityModel>(
        decoratorProps: DropDownDecoratorProps(
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
        ),
        compareFn: (item1, item2) => item1.citiesId == item2.citiesId,
        items: (String filter, LoadProps? props) {
          return controller.cities;
        },
        itemAsString: (CityModel? gov) => gov?.cityNameAr ?? "",
        dropdownBuilder: (context, selectedItem) =>
            Text(selectedItem?.cityNameAr ?? "اختر المدينة"),
        onChanged: (CityModel? selectedGov) {
          if (selectedGov != null) {
            controller.selectedCity = selectedGov;
          }
        },
        popupProps: PopupProps.menu(showSearchBox: true),
      ),
    );
  }
}
