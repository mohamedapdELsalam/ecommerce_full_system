import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomAppbarHomepage extends StatelessWidget {
  const BottomAppbarHomepage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var myColors = Get.theme.colorScheme;
    var myTheme = Get.theme;
    // var appHeight = MediaQuery.of(context).size.height;
    // var appWidth = MediaQuery.of(context).size.width;
    return Container(
      // margin: const EdgeInsets.only(top: 10),
      // padding: appWidth >= 1200
      //     ? EdgeInsets.symmetric(horizontal: 200)
      //     : EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: [
          Expanded(
              flex: 7,
              child: TextFormField(
                style: myTheme.textTheme.bodySmall,
                decoration: InputDecoration(
                    fillColor: myColors.surface,
                    filled: true,
                    hintText: "find a product",
                    hintStyle: myTheme.textTheme.bodySmall!
                        .copyWith(color: Colors.grey),
                    contentPadding: const EdgeInsets.symmetric(vertical: 0),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(13))),
                    prefixIcon: Icon(
                      Icons.search,
                      color: myColors.onSecondary,
                      size: 20,
                    )),
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
