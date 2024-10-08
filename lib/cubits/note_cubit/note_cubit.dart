import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../models/note_model.dart';
import 'note_cubit_states.dart';

class NoteCubit extends Cubit<NoteCubitStates> {
  NoteCubit() : super(NoteInitialState());
  List<NoteModel>? notes;
  fetchAllNotes(){
    var noteBox = Hive.box<NoteModel>('note box');
     notes = noteBox.values.toList();
     emit(NoteSuccessState());
  }
}
