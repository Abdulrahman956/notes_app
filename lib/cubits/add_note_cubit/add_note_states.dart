class AddNoteStates {}

class InitialState extends AddNoteStates {}

class LoadingState extends AddNoteStates {}

class SuccessState extends AddNoteStates {}

class FailureState extends AddNoteStates {
  final String errorMessage;

  FailureState(this.errorMessage);
}


