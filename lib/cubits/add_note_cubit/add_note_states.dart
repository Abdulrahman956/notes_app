class AddNoteStates {}

class AddInitialState extends AddNoteStates {}

class AddLoadingState extends AddNoteStates {}

class AddSuccessState extends AddNoteStates {}

class AddFailureState extends AddNoteStates {
  final String errorMessage;

  AddFailureState(this.errorMessage);
}


