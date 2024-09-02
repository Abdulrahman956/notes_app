import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/models/note_model.dart';
import 'package:flutter/material.dart';
import 'add_note_states.dart';

class AddNoteCubit extends Cubit<AddNoteStates> {
  AddNoteCubit() : super(AddInitialState());
  Color color =  Colors.amber[300]!;

  addNote(NoteModel noteModel) {
    noteModel.color = color.value;
    emit(AddLoadingState());
    try {
      var noteBox = Hive.box<NoteModel>('note box');
      emit(AddSuccessState());
      noteBox.add(noteModel);
    } catch (e) {
      emit(AddFailureState(e.toString()));
    }
  }
}
