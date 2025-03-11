import 'package:ecommerceapp/controller/profile_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        title: Text("profile"),
      ),
      body: Center(child: Text("profile screen")),
    );
  }
}
