import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:todoey/widgets/task_tile.dart';

final _firestore = FirebaseFirestore.instance;

class TaskStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('Notes')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final notes = snapshot.data!.docs.reversed;
        List<TaskTile> taskCards = [];
        for (final note in notes) {
          taskCards.add(
            TaskTile(
              taskTitle: note['Note'],
              isChecked: note['isDone'],

              checkboxCallback: (value) {
                value = true;
              },
              longPressCallback: () {},

              // checkboxCallback: (checkboxState) {
              //   taskData.updateTaskStatus(task);
              // },
              // longPressCallback: () {
              //   taskData.deleteTask(task);
              // },
            ),
          );
        }
        return ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 20.0,
          ),
          children: taskCards,
        );
      },
    );
  }
}
