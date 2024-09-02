import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../cubits/add_note_cubit/add_note_cubit.dart';
import '../cubits/add_note_cubit/add_note_states.dart';
import '../models/note_model.dart';
import 'colors_list.dart';
import 'custom_bottom.dart';
import 'custom_text_form_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? title, desc;
  final bool isLoaded = false;
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        children: [
          CustomTextFormField(
            onSaved: (value) {
              title = value;
            },
            hint: 'Enter Title',
            maxLines: 1,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            onSaved: (value) {
              desc = value;
            },
            hint: 'Enter Description',
            maxLines: 5,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 40),
            child: ColorsListView(),
          ),
          BlocBuilder<AddNoteCubit, AddNoteStates>(builder: (context, state) {
            String formattedDateTime = DateFormat('yyyy-MM-dd').format(now);
            return CustomBottom(
              isLoaded: state is AddLoadingState ? true : false,
              onTap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  var noteModel = NoteModel(
                      title: title!,
                      desc: desc!,
                      date: formattedDateTime,
                      color: Colors.orange.value);
                  BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                } else {
                  autoValidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
            );
          }),
        ],
      ),
    );
  }
}
