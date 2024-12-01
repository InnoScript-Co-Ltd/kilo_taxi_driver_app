import 'package:flutter/material.dart';
import 'package:kilo_driver_app/theme/resource/colors.dart';

class TextFieldWidget extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final bool obscureText;
  const TextFieldWidget({
    super.key,
    required this.labelText,
    this.hintText,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200, // Background color
        borderRadius: BorderRadius.circular(4.0), // Rounded corners
      ),
      child: TextField(
        obscureText: obscureText,
        cursorColor: TEXT_COLOR,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          labelStyle: const TextStyle(color: TEXT_COLOR),
          border: InputBorder.none, // Removes default border
          contentPadding: const EdgeInsets.symmetric(
              horizontal: 16, vertical: 12), // Padding inside the field
        ),
      ),
    );
  }
}
