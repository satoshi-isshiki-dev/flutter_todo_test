import 'package:flutter/material.dart';
import 'package:flutter_todo_test/app/app_model.dart';
import 'package:flutter_todo_test/screens/view_model/task_list_view_model.dart';
import 'package:flutter_todo_test/screens/widgets/task_list_error_message_widget.dart';
import 'package:flutter_todo_test/screens/widgets/widgets.dart';
import 'package:provider/provider.dart';

class TaskListPage extends StatelessWidget {
  const TaskListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Список задач'),
        actions: [
          IconButton(
            tooltip: 'Изменить цветовую тему',
            onPressed: () => context.read<AppModel>().changeAppTheme(),
            icon: context.watch<AppModel>().darkMode
                ? const Icon(
                    Icons.dark_mode,
                    color: Colors.white,
                  )
                : const Icon(
                    Icons.light_mode,
                    color: Colors.black,
                  ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            const TasksButtonSection(),
            const Padding(
              padding: EdgeInsets.only(top: 30, bottom: 15),
              child: SizedBox(
                height: 1,
                width: double.infinity,
                child: ColoredBox(color: Colors.black12),
              ),
            ),
            context.watch<TaskListViewModel>().availableForm
                ? const TaskForm()
                : const SizedBox(),
            context.watch<TaskListViewModel>().errorMessage != null
                ? const ErrorMessage()
                : const SizedBox(),
            const Expanded(child: TaskList()),
            
          ],
        ),
      ),
    );
  }
}
