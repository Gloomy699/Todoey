import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todoey/components/streem_task.dart';
// import 'package:todoey/widgets/task_tile.dart';
// import 'package:provider/provider.dart';
// import 'package:todoey/models/task_data.dart';

final _firestore = FirebaseFirestore.instance;

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return TaskStream();
    return StreamBuilder<QuerySnapshot>(
        stream: _firestore
            .collection('Users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('Notes')
            .snapshots(),
        builder: (context, snapshot) {
          return TaskStream();
        });

    //   builder: (context, taskData, child) {
    //     return ListView.builder(
    //       itemCount: taskData.taskCount,
    //       itemBuilder: (context, index) {
    //         final task = taskData.tasks[index];
    //         return TaskTile(
    //           isChecked: task.isDone,
    //           taskTitle: task.name,
    //           checkboxCallback: (checkboxState) {
    //             taskData.updateTaskStatus(task);
    //           },
    //           longPressCallback: () {
    //             taskData.deleteTask(task);
    //           },
    //         );
    //       },
  }
}
