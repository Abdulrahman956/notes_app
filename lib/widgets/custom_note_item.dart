import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/edit_note_view.dart';

import '../cubits/note_cubit/note_cubit.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({super.key, required this.noteModel});

  final NoteModel noteModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return const EditNoteView();
        }));
      },
      child: Container(
        padding: const EdgeInsets.only(top: 16, bottom: 20, left: 8),
        decoration: BoxDecoration(
            color: Colors.yellow, borderRadius: BorderRadius.circular(16)),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Text(
                  noteModel.title,
                  style: const TextStyle(fontSize: 28, color: Colors.black),
                ),
                trailing: IconButton(
                    onPressed: () {
                      noteModel.delete();
                      BlocProvider.of<NoteCubit>(context).fetchAllNotes();
                    },
                    icon: const Icon(
                      Icons.delete,
                      size: 36,
                      color: Colors.black,
                    )),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    noteModel.desc,
                    style: const TextStyle(fontSize: 16, color: Colors.black45),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 50),
                child: Text(
                  noteModel.date,
                  style: const TextStyle(fontSize: 14, color: Colors.black45),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
