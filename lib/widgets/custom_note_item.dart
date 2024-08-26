import 'package:flutter/material.dart';
import 'package:note_app/views/edit_note_view.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context){
          return const EditNoteView();
        }));
      },
      child: Container(
        padding: const EdgeInsets.only(top: 16, bottom: 20, left: 8),
        decoration: BoxDecoration(
            color: Colors.yellow, borderRadius: BorderRadius.circular(16)),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: const Text(
                  "Flutter App",
                  style: TextStyle(fontSize: 28, color: Colors.black),
                ),
                trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete,
                      size: 36,
                      color: Colors.black,
                    )),
                subtitle: const Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    "build my app build my app build my app",
                    style: TextStyle(fontSize: 16, color: Colors.black45),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 24),
                child: Text(
                  "2024/8/2",
                  style: TextStyle(fontSize: 14, color: Colors.black45),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
