import 'package:flutter/material.dart';
import 'package:flutter_todo_test/screens/view_model/task_list_view_model.dart';
import 'package:provider/src/provider.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      context.read<TaskListViewModel>().errorMessage!,
      style: const TextStyle(
        color: Colors.red,
      ),
    );
  }
}
