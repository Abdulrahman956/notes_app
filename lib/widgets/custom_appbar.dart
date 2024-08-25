import 'package:flutter/material.dart';

import 'custom_search_icon.dart';
class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Notes",style: TextStyle(fontSize: 28),),
        CustomSearchIcon(),
      ],
    );
  }
}
