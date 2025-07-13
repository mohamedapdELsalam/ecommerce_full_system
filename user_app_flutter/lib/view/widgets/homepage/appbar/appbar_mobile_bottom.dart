import 'package:ecommerceapp/controller/homepage_controller.dart';
import 'package:ecommerceapp/core/constants/lang_keys.dart';
import 'package:ecommerceapp/core/extensions/context_extensions.dart';
import 'package:ecommerceapp/core/screen_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomAppbarHomepage extends StatelessWidget {
  const BottomAppbarHomepage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomePageController controller = Get.find();
    return Row(
      children: [
        Expanded(
            flex: Responsible.isMobile(context) ? 5 : 1,
            child: SearchFieldAppBar(
              searchCtrl: controller.searchCtrl,
              onChanged: (val) {
                controller.checkSearch(val);
              },
              onSearch: () {
                controller.onSearch();
              },
              hint: LangKeys.searchFieldHint.tr,
            )),
        Expanded(
          child: SizedBox(),
        )
      ],
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
    return TextFormField(
      onFieldSubmitted: (value) {
        onSearch!();
      },
      controller: searchCtrl,
      onChanged: onChanged,
      style: context.textTheme.bodySmall,
      decoration: InputDecoration(
        fillColor: context.onPrimaryColor,
        filled: true,
        hintText: hint,
        hintStyle: context.textTheme.bodyMedium!.copyWith(color: Colors.grey),
        contentPadding: const EdgeInsets.symmetric(vertical: 0),
        border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        prefixIcon: IconButton(
          icon: Icon(
            Icons.search,
            color: context.onSecondary,
            size: 20,
          ),
          onPressed: onSearch,
        ),
      ),
    );
  }
}
