import 'package:flutter_bloc/flutter_bloc.dart';

import 'note_cubit_states.dart';

class NoteCubit extends Cubit<NoteCubitStates>{
  NoteCubit() : super(NoteInitialState());

}