import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/custom_text_form_field.dart';

import '../cubits/note_cubit/note_cubit.dart';
import '../widgets/custom_appbar.dart';

class EditNoteView extends StatefulWidget {
  const EditNoteView({super.key, required this.noteModel});

  final NoteModel noteModel;

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
   String? title , desc;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            children: [
              CustomAppbar(
                  onPressed: () {
                    widget.noteModel.title = title ?? widget.noteModel.title;
                    widget.noteModel.desc = desc ?? widget.noteModel.desc;
                    widget.noteModel.save();
                    BlocProvider.of<NoteCubit>(context).fetchAllNotes();
                    Navigator.pop(context);
                  },
                  title: 'Edit Note',
                  icon: Icons.done_outline_sharp),
              const SizedBox(
                height: 30,
              ),
               CustomTextFormField(
                onChanged: (value){
                  title = value;
                },
                hint: widget.noteModel.title,
                maxLines: 1,
              ),
              const SizedBox(
                height: 20,
              ),
               CustomTextFormField(
                 onChanged: (value){
                   desc = value;
                 },
                hint: widget.noteModel.desc,
                maxLines: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
