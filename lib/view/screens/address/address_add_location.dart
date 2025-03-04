import 'package:flutter/material.dart';

class AddressAddLocation extends StatelessWidget {
  const AddressAddLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Step 1 : choice your location",
          style: TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}
