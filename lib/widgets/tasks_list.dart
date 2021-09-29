// import 'package:flutter/material.dart';
// import 'package:todoey/widgets/task_tile.dart';
// import 'package:provider/provider.dart';
// import 'package:todoey/models/task_cubit.dart';

// class TasksList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<TaskData>(
//       builder: (
//         context,
//         taskData,
//         child,
//       ) {
//         return ListView.builder(
//           itemCount: taskData.taskCount,
//           itemBuilder: (context, index) {
//             final task = taskData.tasks[index];
//             return TaskTile(
//               isChecked: task.isDone,
//               taskTitle: task.name,
//               checkboxCallback: (checkboxState) =>
//                   taskData.updateTaskStatus(task),
//               longPressCallback: () => taskData.deleteTask(task),
//             );
//           },
//         );
//       },
//     );
//   }
// }
