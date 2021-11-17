import 'package:flutter/material.dart';
import 'package:flutter_todo_test/app/app_model.dart';
import 'package:flutter_todo_test/screens/view/task_list_page.dart';
import 'package:flutter_todo_test/screens/view_model/task_list_view_model.dart';
import 'package:flutter_todo_test/ui/theme/app_theme.dart';
import 'package:provider/provider.dart';

// ! Класс для хранения именований боксов для  Hive
abstract class HiveBoxes {
  static const String todo = 'todo_box';
  static const String settings = 'settings_box';
}

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppModel>(
      create: (context) => AppModel(),
      // ? Чтобы можно было сразу же обратиться к appModel и не потерять context
      child: Consumer<AppModel>(
        builder: (context, appModel, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Pseudo App',
            theme: appModel.darkMode ? AppTheme.dark() : AppTheme.light(),
            home: ChangeNotifierProvider(
              create: (BuildContext context) => TaskListViewModel(),
              child: const TaskListPage(),
            ),
          );
        },
      ),
    );
  }
}
