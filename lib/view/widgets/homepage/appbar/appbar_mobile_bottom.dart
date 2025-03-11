import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomAppbarHomepage extends StatelessWidget {
  final controller;
  const BottomAppbarHomepage({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // var appHeight = MediaQuery.of(context).size.height;
    // var appWidth = MediaQuery.of(context).size.width;
    return Container(
      child: Row(
        children: [
          Expanded(
              flex: 7,
              child: SearchFieldAppBar(
                searchCtrl: controller.searchCtrl,
                onChanged: (val) {
                  controller.checkSearch(val);
                  print(" -------------------------- val : $val");
                },
                onSearch: controller.onSearch,
                hint: "46".tr,
              )),
          Expanded(
            flex: 2,
            child: SizedBox(),
            // child: Container(
            //   padding: const EdgeInsets.all(4),
            //   margin: const EdgeInsets.only(left: 5),
            //   decoration: BoxDecoration(
            //       color: myColors.onPrimary,
            //       borderRadius: const BorderRadius.all(Radius.circular(10))),
            //   child: InkWell(
            //     onTap: () {},
            //     child: SvgPicture.asset(
            //       SvgAssets.filterMarket,
            //       colorFilter:
            //           ColorFilter.mode(myColors.onPrimary, BlendMode.color),
            //     ),
            //   ),
            // )
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
