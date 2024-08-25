import 'package:flutter/material.dart';

import 'custom_appbar.dart';
import 'custom_note_item.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          CustomAppbar(),
          SizedBox(
            height: 24,
          ),
          CustomNoteItem(),
        ],
      ),
    );
  }
}


