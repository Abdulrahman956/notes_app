import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../models/note_model.dart';
import 'note_cubit_states.dart';

class NoteCubit extends Cubit<NoteCubitStates>{
  NoteCubit() : super(NoteInitialState());
fetchAllNotes(){
  try{
    var noteBox =  Hive.box<NoteModel>('note box');
    var notes = noteBox.values.toList();
    emit(NoteSuccessState(notes));
  }catch(e){
    emit(NoteFailureState(e.toString()));
  }
}
}