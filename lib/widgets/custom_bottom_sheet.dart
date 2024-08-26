import 'package:flutter/material.dart';

import 'custom_text_form_field.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.grey[800],
        //height: 450,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const CustomTextFormField(hint: 'Enter Title', maxLines: 1,),
              const SizedBox(
                height: 20,
              ),
              const CustomTextFormField(hint: 'Enter Description', maxLines: 5,),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Submit")),
            ],
          ),
        ),
      ),
    );
  }
}


