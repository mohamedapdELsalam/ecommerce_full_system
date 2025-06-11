import 'package:dropdown_search/dropdown_search.dart';
import 'package:ecommerceapp/controller/address/address_step2_controller.dart';
import 'package:ecommerceapp/core/class/handlind_status_request.dart';
import 'package:ecommerceapp/core/constants/lang_keys.dart';
import 'package:ecommerceapp/core/functions/transulateDatabase.dart';
import 'package:ecommerceapp/data/model/city_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class DropdownCity extends StatelessWidget {
  const DropdownCity({
    super.key,
    required this.controller,
  });

  final AddressStep2Controller controller;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddressStep2Controller>(
        builder: (controller) => HandlingStatusRequest(
            statusRequest: controller.statusRequest,
            widget: Container(
              margin: EdgeInsets.only(bottom: 20),
              child: DropdownSearch<CityModel>(
                decoratorProps: DropDownDecoratorProps(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                compareFn: (item1, item2) => item1.citiesId == item2.citiesId,
                items: (String filter, LoadProps? props) {
                  return controller.cities;
                },
                itemAsString: (CityModel gov) => translateDatabase(
                    gov.cityNameAr!,
                    gov.cityNameEn!,
                    gov.cityNameEn!,
                    gov.cityNameEn!),
                dropdownBuilder: (context, selectedItem) => selectedItem != null
                    ? Text(translateDatabase(
                        selectedItem.cityNameAr!,
                        selectedItem.cityNameEn!,
                        selectedItem.cityNameEn!,
                        selectedItem.cityNameEn!))
                    : Text(LangKeys.selectCity.tr),
                onChanged: (CityModel? selectedGov) {
                  if (selectedGov != null) {
                    controller.selectedCity = selectedGov;
                  }
                },
                popupProps: PopupProps.menu(showSearchBox: true),
              ),
            ),
            controller: controller));
  }
}
