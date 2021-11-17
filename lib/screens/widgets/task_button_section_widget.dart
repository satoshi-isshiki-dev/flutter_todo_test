import 'package:flutter/material.dart';
import 'package:flutter_todo_test/screens/view_model/task_list_view_model.dart';
import 'package:flutter_todo_test/ui/custom/task_button_widget.dart';
import 'package:provider/provider.dart';

class TasksButtonSection extends StatelessWidget {
  const TasksButtonSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _model = context.read<TaskListViewModel>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Tasks',
          style: TextStyle(
            fontSize: 56,
            fontWeight: FontWeight.w900,
          ),
        ),
        TaskButton(
          onPressed: () {
            // Чтобы лишний раз notifyListeners() не вызывать
            if (_model.availableForm) return;

            // Эх, работа с UI через 'бульки', тупо, но быстро 😅😅
            _model.showTaskForm();
          },
        ),
      ],
    );
  }
}
