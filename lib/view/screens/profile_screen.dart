import 'package:ecommerceapp/controller/profile_controller.dart';
import 'package:ecommerceapp/core/screen_dimensions.dart';
import 'package:ecommerceapp/view/widgets/homepage/appbar/appbar_disktop.dart';
import 'package:ecommerceapp/view/widgets/homepage/appbar/appbar_mobile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController controller = Get.put(ProfileController());
    return Column(children: [
      Responsible(
          mobile: AppbarHomepage(
            controller: controller,
            title: "Profile",
          ),
          desktop: AppBardesktop()),
      Text("profile screen")
    ]);
  }
}
