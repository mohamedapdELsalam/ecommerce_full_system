import 'package:flutter/material.dart';

class AddressTextForm extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  const AddressTextForm({
    required this.hint,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 13),
            hintText: hint,
            hintStyle: TextStyle(fontSize: 14)),
      ),
    );
  }
}
