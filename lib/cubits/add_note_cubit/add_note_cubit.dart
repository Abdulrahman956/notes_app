import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/models/note_model.dart';

import 'add_note_states.dart';

class AddNoteCubit extends Cubit<AddNoteStates>{
  AddNoteCubit() : super (AddInitialState());
  addNote(NoteModel noteModel){
    emit(AddLoadingState());
  try{
    var noteBox =  Hive.box<NoteModel>('note box');
    emit(AddSuccessState());
    noteBox.add(noteModel);
  }catch(e){
    emit(AddFailureState(e.toString()));
  }
  }
}