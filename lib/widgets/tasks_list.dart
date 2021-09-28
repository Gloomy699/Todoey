import 'package:flutter/material.dart';
import 'package:todoey/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (
        _context,
        _taskData,
        _child,
      ) {
        return ListView.builder(
          itemCount: _taskData.taskCount,
          itemBuilder: (context, index) {
            final task = _taskData.tasks[index];
            return TaskTile(
              isChecked: task.isDone,
              taskTitle: task.name,
              checkboxCallback: (checkboxState) =>
                  _taskData.updateTaskStatus(task),
              longPressCallback: () => _taskData.deleteTask(task),
            );
          },
        );
      },
    );
  }
}
