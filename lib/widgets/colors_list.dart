import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/add_note_cubit/add_note_cubit.dart';

class ColorsList extends StatelessWidget {
  const ColorsList({super.key, required this.isActive, required this.colors});

  final bool isActive;
  final Color colors;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? Stack(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: colors,
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(
                  Icons.done_outlined,
                  color: Colors.black54,
                  size: 40,
                ),
              ),
            ],
          )
        : CircleAvatar(
            radius: 30,
            backgroundColor: colors,
          );
  }
}

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex = 0;

  List<Color> darkModeColors = [
    Colors.amber[300]!, // A subdued amber
    Colors.deepPurple[300]!, // A soft purple
    Colors.teal[300]!, // A muted teal
    Colors.indigo[300]!, // A calm indigo
    Colors.orange[300]!, // A warm, yet not too bright orange
    Colors.pink[300]!, // A soft pink
    Colors.green[300]!, // A gentle green
    Colors.blueGrey[300]!, // A muted blue-grey
    Colors.cyan[300]!, // A light cyan
    Colors.lime[300]!, // A soft lime
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;
                BlocProvider.of<AddNoteCubit>(context).color =
                    darkModeColors[index];
                setState(() {});
              },
              child: ColorsList(
                colors: darkModeColors[index],
                isActive: currentIndex == index,
              ),
            ),
          );
        },
        itemCount: darkModeColors.length,
      ),
    );
  }
}
