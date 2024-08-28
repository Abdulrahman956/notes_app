import 'package:flutter/material.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom({super.key, this.onTap, required this.isLoaded});

  final bool isLoaded;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
            child: isLoaded
                ? const CircularProgressIndicator(
                    color: Colors.black45,
                  )
                : const Text(
                    'Submit',
                    style: TextStyle(fontSize: 18, color: Colors.black87),
                  )),
      ),
    );
  }
}
