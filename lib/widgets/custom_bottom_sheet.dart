import 'package:flutter/material.dart';

import 'custom_text_form_field.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: AddNoteForm(),
      ),
    );
  }
}

class AddNoteForm extends StatefulWidget {
   const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
 final GlobalKey<FormState> formKey = GlobalKey();
 AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
 String ? title , desc;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        children: [
           CustomTextFormField(
            onSaved: (value){
              title = value;
            },
            hint: 'Enter Title',
            maxLines: 1,
          ),
          const SizedBox(
            height: 20,
          ),
           CustomTextFormField(
            onSaved: (value){
              desc = value;
            },
            hint: 'Enter Description',
            maxLines: 5,
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
              onPressed: () {
                if(formKey.currentState!.validate()){
                  formKey.currentState!.save();
                }else{
                  autoValidateMode = AutovalidateMode.always;
                  setState(() {

                  });
                }
              },
              child: const Text("Submit")),
        ],
      ),
    );
  }
}
