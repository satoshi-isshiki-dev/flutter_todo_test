import 'package:flutter_todo_test/app/app.dart';
import 'package:flutter_todo_test/entity/task.dart';
import 'package:hive/hive.dart';

class HiveManager {
  // ! Бахнем синглтон, чтобы каждый раз не создвать менеджера в памяти
  HiveManager._();
  static HiveManager? _instance;
  // ! Фабричный конструктор (Может создать инстанс, а может вернуть существующий)
  factory HiveManager.instance() {
    _instance ??= HiveManager._();
    return _instance!;
  }

  // ! Создать TaskBox с проверками (на уже открытость и наличия адаптера)
  Future<Box<Task>> openTaskBox() async {
    return _openBox(HiveBoxes.todo, 0, TaskAdapter());
  }

  // Создать SettingsBox с проверками (на уже открытость и наличия адаптера)
  // Future<Box<Task>> openTaskBox() async {
  //   return _openBox(HiveBoxes.todo, 0, TaskAdapter());
  // }

  Future<Box<T>> _openBox<T>(
    String name,
    int typeId,
    TypeAdapter<T> adapter,
  ) async {
    if (Hive.isBoxOpen(name)) {
      return Hive.box(name);
    }
    if (!Hive.isAdapterRegistered(typeId)) {
      Hive.registerAdapter(adapter);
    }
    return Hive.openBox<T>(name);
  }

  // ! Не забывать закрывать Box
  // Скорей всего в этом примере не понадобиться, т.к. всего 1 экран
  Future<void> closeBox<T>(Box<T> box) async {
    await box.compact(); // ? Сжать
    await box.close(); // ? Закрыть
  }
}
