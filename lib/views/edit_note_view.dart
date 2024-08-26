import 'package:flutter/material.dart';
import 'package:note_app/widgets/custom_text_form_field.dart';

import '../widgets/custom_appbar.dart';
class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            children: [
              CustomAppbar(title: 'Edit Note',icon: Icons.done_outline_sharp),
              SizedBox(height: 30,),
              CustomTextFormField(hint: 'Enter Title', maxLines: 1,),
              SizedBox(
                height: 20,
              ),
               CustomTextFormField(hint: 'Enter Description', maxLines: 5,),
            ],
          ),
        ),
      ),
    );
  }
}
