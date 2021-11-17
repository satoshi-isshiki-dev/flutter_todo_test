import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_todo_test/entity/task.dart';
import 'package:flutter_todo_test/services/local_storage_manager.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TaskListViewModel with ChangeNotifier {
  late final Future<Box<Task>> _box;
  // Для прослушки внутри бокса
  ValueListenable<Box<Task>>? _listenableBox;

  // 😒😒 ...
  bool _isAvailableForm = false;
  bool get availableForm => _isAvailableForm;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  List<Task> _tasks = [];
  List<Task> get tasks => [..._tasks.reversed];

  final formKey = GlobalKey<FormState>();

  // ! В Конструкторе инициализируем открытие бокса с прослушкой на изменения
  TaskListViewModel() {
    _init();
  }

  showTaskForm() {
    _isAvailableForm = true;
    notifyListeners();
  }

  Future<void> completeTask(int index) async {
    final task = (await _box).getAt(tasks.length - 1 - index);
    task?.isComplete = !task.isComplete;
    await task?.save();
  }

  final taskTextController = TextEditingController();

  Future<void> _readTaskFromBox() async {
    _tasks = (await _box).values.toList();
    notifyListeners();
  }

  void _init() async {
    _box = HiveManager.instance().openTaskBox();
    await _readTaskFromBox();

    // Чтобы потом в каждом методе при работе с данными из базы не копипастить _readTaskFromBox и notifyListeners()
    // Бахнем сразу прослушку таким образом
    _listenableBox = (await _box).listenable()..addListener(_readTaskFromBox);
  }

  // ! По хорошему нужно от всего отписаться и закрыть
  // Возможно, опять же для данной апки это и не понадобиться ...
  @override
  Future<void> dispose() async {
    _listenableBox?.removeListener(_readTaskFromBox);
    await HiveManager.instance().closeBox((await _box));
    super.dispose();
  }

  Future<void> addTask(String text) async {
    // Провалидируем строчку немного
    if (text.trim().isEmpty) {
      _errorMessage = 'Задача не может пыть пустой!';
    } else {
      _errorMessage = null;

      // 😅😅👌 ...
      (await _box).add(
        Task(
          name: text.trim(),
          isComplete: false,
        ),
      );
    }
    _isAvailableForm = false;
    notifyListeners();
  }

  Future<void> removeTask(int index) async {
    (await _box).deleteAt(tasks.length - 1 - index);
  }
}
