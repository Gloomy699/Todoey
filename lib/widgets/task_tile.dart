import 'package:flutter/material.dart';
import 'package:todoey/constans.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;

  final void Function(bool?) checkboxCallback;
  final longPressCallback;

  TaskTile({
    required this.isChecked,
    required this.taskTitle,
    required this.checkboxCallback,
    required this.longPressCallback,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(
        taskTitle,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: primaryColor,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
    );
  }
}
