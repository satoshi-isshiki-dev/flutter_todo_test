import 'package:flutter/material.dart';
import 'package:flutter_todo_test/screens/view_model/task_list_view_model.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _model = context.watch<TaskListViewModel>();
    if (_model.tasks.isEmpty) {
      return const Text("Список пустой");
    }
    return ListView.builder(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      itemCount: _model.tasks.length,
      itemBuilder: (context, index) {
        return Dismissible(
          direction: DismissDirection.endToStart,
          key: UniqueKey(),
          onDismissed: (direction) =>
              context.read<TaskListViewModel>().removeTask(index),
          movementDuration: const Duration(seconds: 1),
          background: ColoredBox(
            color: Colors.red,
            child: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 15.0),
              child: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
          ),

          // Вместо ListTile, своя кастомная вёрстка чтобы попасть в макет ...
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: GestureDetector(
              onTap: () => _model.completeTask(index),
              child: Row(
                children: [
                  _model.tasks[index].isComplete
                      ? const Icon(
                          Icons.check_box,
                          color: Colors.grey,
                          size: 24,
                        )
                      : const Icon(
                          Icons.check_box_outline_blank,
                          color: Colors.grey,
                          size: 24,
                        ),
                  const SizedBox(width: 6),
                  Text(
                    _model.tasks[index].name,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
