import 'package:ecommerceapp/controller/homepage_controller.dart';
import 'package:ecommerceapp/controller/homescreen_controller.dart';
import 'package:ecommerceapp/view/widgets/homepage/appbar/appbar_mobile_bottom.dart';
import 'package:ecommerceapp/view/widgets/homepage/appbar/disktop_buttonsBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBardesktop extends GetView<HomeScreenController> {
  const AppBardesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var myColors = Theme.of(context).colorScheme;
    HomePageController homepageController = Get.put(HomePageController());

    return Container(
      height: 60,
      color: myColors.primary,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Spacer(flex: 1),
            Text(
              "Ebn Aouf Markt",
              style: TextStyle(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontStyle: FontStyle.italic,
                  fontSize: 30),
            ),
            Spacer(
              flex: 1,
            ),
            Flexible(
              flex: 5,
              child: SearchFieldAppBar(
                  searchCtrl: homepageController.searchCtrl,
                  onChanged: (val) {
                    homepageController.checkSearch(val);
                  },
                  onSearch: homepageController.onSearch,
                  hint: "search for products"),
            ),
            Spacer(flex: 2),
            AppbarDisktopButtonsBar(),
            Spacer(flex: 1),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: myColors.error),
              child: Center(
                child: IconButton(
                  icon: Icon(
                    Icons.notifications_none,
                    color: myColors.onPrimary,
                    size: 18,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
            Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}

class AppbarDisktopButton extends StatelessWidget {
  const AppbarDisktopButton({
    super.key,
    required this.myColors,
    required this.title,
    required this.onpressed,
  });

  final ColorScheme myColors;
  final String title;
  final void Function()? onpressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: TextButton(
        style:
            ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.white)),
        onPressed: onpressed,
        child: Text(
          title,
          style: TextStyle(color: myColors.primary),
        ),
      ),
    );
  }
}
