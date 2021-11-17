// ignore_for_file: file_names

import 'package:hive/hive.dart';

// ! Немного Hive кодогенерации для удобства 👌
part 'task.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(0)
  bool isComplete;
  @HiveField(1)
  String id;
  @HiveField(2)
  String name;

  Task({
    required this.isComplete,
    required this.name,
  }) : id = '0';
}
