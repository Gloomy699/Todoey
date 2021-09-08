import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('this is 1st task'),
      trailing: Checkbox(
        value: false,
        onChanged: null,
      ),
    );
  }
}
