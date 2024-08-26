import 'package:flutter/material.dart';
class CustomIcon extends StatelessWidget {
   const CustomIcon({super.key,required this.icon, required this.onTap});
final IconData icon;
final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 50,
        decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey[800],
        ),
        child:Icon(icon),
      ),
    );
  }
}
