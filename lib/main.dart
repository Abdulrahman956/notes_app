import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/bloc_observer.dart';
import 'package:note_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/notes_view.dart';

void main() async {
  runApp(const MyApp());
  Bloc.observer = SimpleBlocObserver();
 await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
 await Hive.openBox('note box');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> AddNoteCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: const NotesView(),
      ),
    );
  }
}