import 'package:flutter/material.dart';

class GlobalTextForm extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final String? Function(String?) validator;
  const GlobalTextForm({
    super.key,
    required this.hint,
    required this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: 1,
      maxLines: 3,
      validator: validator,
      controller: controller,
      style: TextTheme.of(context).bodyMedium,
      decoration: InputDecoration(
        hintStyle: TextStyle(
          color: ColorScheme.of(context).onSecondary.withAlpha(140),
          fontSize: 13,
        ),
        fillColor: ColorScheme.of(context).onPrimary.withAlpha(160),
        filled: true,

        border: OutlineInputBorder(
          borderSide: BorderSide(
            strokeAlign: 1,
            width: 1,
            color: const Color.fromARGB(87, 63, 62, 62),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            strokeAlign: 1,
            width: 1,
            color: const Color.fromARGB(87, 63, 62, 62),
          ),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        hintText: hint,
      ),
    );
  }
}
