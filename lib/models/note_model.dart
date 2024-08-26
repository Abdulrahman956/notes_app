import 'package:hive/hive.dart';

part 'note_model.g.dart';

@HiveType(typeId: 0) // to specify id of object in database from (0 : 223)
class NoteModel extends HiveObject {
  @HiveField(0) // to specify id of field in database
  final String title;
  @HiveField(1)
  final String desc;
  @HiveField(2)
  final String date;
  @HiveField(3)
  final int color;

  NoteModel({
    required this.title,
    required this.desc,
    required this.date,
    required this.color,
  });
}
