import 'package:flutter/material.dart';

import 'custom_icon.dart';
class CustomAppbar extends StatelessWidget {
   const CustomAppbar({super.key,required this.title,required this.icon});
final String title;
final IconData icon;
  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: const TextStyle(fontSize: 28),),
         CustomIcon(icon: icon, onTap: () {},),
      ],
    );
  }
}
