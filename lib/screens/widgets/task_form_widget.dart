import 'package:flutter/material.dart';
import 'package:flutter_todo_test/screens/view_model/task_list_view_model.dart';
import 'package:provider/provider.dart';

// todo
// [-] Сохранение таски при скрытии клавиатуры ... 🤷‍♂️
// [+] Перенести логику из TaskForm во ViewModel или оставить так (т.к. пример пример оч. простой)
// [+] Дизайн списка по макету (не PixelPerfect, но близко)
// [+] Сделать отдельный файл для темы UI
// [+] Сделать переключение светлой и темной темы
// [+] Причесать код HiveManager
// [-] Подумать над архитектуркой и "сервисами" или нет (^◕.◕^)

class TaskForm extends StatefulWidget {
  const TaskForm({Key? key}) : super(key: key);

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final _taskController = TextEditingController();

  @override
  void dispose() {
    _taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _model = context.read<TaskListViewModel>();
    return TextField(
      // ! При появлении виджета TextField, сразу сделать фокус на ввод
      autofocus: true,
      controller: _taskController,
      onSubmitted: (value) {
        // ! Перекинуть в модельку только текст из TextField
        // А в модельке уже создать объект и записать в базу ... 😅
        _model.addTask(_taskController.text);
        // _model.hideTaskForm();
      },
    );
  }
}
