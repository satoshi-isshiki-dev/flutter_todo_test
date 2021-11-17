import 'package:flutter/material.dart';

// ! Кастомная кнопка в макете 👌

class TaskButton extends StatelessWidget {
  final void Function()? onPressed;

  const TaskButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      splashColor: Colors.lightGreen,
      color: const Color.fromRGBO(242, 243, 255, 1),
      height: 54,
      minWidth: 54,
      elevation: 1,
      padding: const EdgeInsets.all(0.0),
      child: const Icon(
        Icons.add,
        size: 38,
        color: Color.fromRGBO(87, 87, 103, 1),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
