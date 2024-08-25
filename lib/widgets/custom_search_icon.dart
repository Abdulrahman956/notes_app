import 'package:flutter/material.dart';
class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey[800],
      ),
      child: const Icon(Icons.search,size: 28,),
    );
  }
}
