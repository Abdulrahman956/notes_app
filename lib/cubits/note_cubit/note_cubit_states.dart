import '../../models/note_model.dart';

class NoteCubitStates {}

class NoteInitialState extends NoteCubitStates {}

class NoteLoadingState extends NoteCubitStates {}

class NoteSuccessState extends NoteCubitStates {
  final List<NoteModel> notes;
  NoteSuccessState(this.notes);
}

class NoteFailureState extends NoteCubitStates {
  final String errorMessage;

  NoteFailureState(this.errorMessage);
}


