import 'package:flutter/material.dart';

import 'custom_appbar.dart';
import 'custom_note_item.dart';
import 'notes_list_view.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Column(
        children: [
          CustomAppbar(),
          SizedBox(
            height: 24,
          ),
          Expanded(
            child: NotesListView(),
          ),
        ],
      ),
    );
  }
}
