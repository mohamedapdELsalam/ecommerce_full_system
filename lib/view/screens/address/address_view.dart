import 'package:ecommerceapp/core/constants/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Get.toNamed(AppRoutes.addressAddStep1);
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("Addresses"),
      ),
      body: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text("Cairo"),
                subtitle: Text("elkalafawy"),
                trailing: Text("Alban elfath"),
              ),
            );
          }),
    );
  }
}
