import 'package:ecommerceapp/controller/homepage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomAppbarHomepage extends StatelessWidget {
  const BottomAppbarHomepage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomePageController controller = Get.find();
    return Container(
      child: Row(
        children: [
          Expanded(
              flex: 7,
              child: SearchFieldAppBar(
                searchCtrl: controller.searchCtrl,
                onChanged: (val) {
                  controller.checkSearch(val);
                },
                onSearch: () {
                  controller.onSearch();
                },
                hint: "46".tr,
              )),
          Expanded(
            flex: 2,
            child: SizedBox(),
          )
        ],
      ),
    );
  }
}

class SearchFieldAppBar extends StatelessWidget {
  final dynamic Function()? onSearch;
  final void Function(String)? onChanged;
  final TextEditingController searchCtrl;

  const SearchFieldAppBar({
    super.key,
    required this.hint,
    required this.onSearch,
    required this.onChanged,
    required this.searchCtrl,
  });

  final String hint;

  @override
  Widget build(BuildContext context) {
    var myColors = Get.theme.colorScheme;
    var myTheme = Get.theme;
    return TextFormField(
      controller: searchCtrl,
      onChanged: onChanged,
      style: myTheme.textTheme.bodySmall,
      decoration: InputDecoration(
        fillColor: myColors.surface,
        filled: true,
        hintText: hint,
        hintStyle: myTheme.textTheme.bodyMedium!.copyWith(color: Colors.grey),
        contentPadding: const EdgeInsets.symmetric(vertical: 0),
        border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        prefixIcon: IconButton(
          icon: Icon(
            Icons.search,
            color: myColors.onSecondary,
            size: 20,
          ),
          onPressed: onSearch,
        ),
      ),
    );
  }
}
