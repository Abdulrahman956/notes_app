import 'package:flutter/material.dart';
class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.hint, required this.maxLines, this.onSaved, this.onChanged});
final String hint;
final int maxLines;
final void Function(String?)? onSaved;
final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: onSaved,
      maxLines: maxLines,
      validator: (value){
        if(value?.isEmpty ?? true){
          return 'Field is required';
        }else{
          return null;
        }
      },
      decoration: InputDecoration(
        hintText: hint,
        border: const OutlineInputBorder(),
      ),
    );
  }
}