import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:note_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/cubits/add_note_cubit/add_note_states.dart';

import 'custom_text_form_field.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocConsumer<AddNoteCubit,AddNoteStates>(
            listener: (context,state){
                if(state is AddFailureState){
                  print('Failure ${state.errorMessage}');
                }
                if(state is AddSuccessState){
                  Navigator.pop(context);
                }
                
            },
            builder:(context,state) {
              return  ModalProgressHUD(
                  inAsyncCall: state is AddLoadingState ? true : false,
                  child: const AddNoteForm());
            }),
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
