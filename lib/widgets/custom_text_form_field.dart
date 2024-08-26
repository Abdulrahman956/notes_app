import 'package:flutter/material.dart';
class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.hint, required this.maxLines});
final String hint;
final int maxLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        border: const OutlineInputBorder(),
      ),
    );
  }
}