import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/note_cubit/note_cubit.dart';
import 'package:note_app/cubits/note_cubit/note_cubit_states.dart';
import 'package:note_app/models/note_model.dart';

import 'custom_note_item.dart';
class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<NoteCubit,NoteCubitStates>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NoteCubit>(context).notes ?? [];
        return ListView.separated(
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (context,index) => const Divider(),
            itemCount: notes.length,
            itemBuilder: (context,index){
              return const CustomNoteItem();
            });
      }
    );
  }
}
