import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoey/models/Todo.dart';
import 'package:todoey/repository/todo_cubit.dart';

class TodosListView extends StatelessWidget {
  const TodosListView({
    required this.todos,
  });

  final List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return GestureDetector(
          onLongPress: () {
            showDialog<String>(
              context: context,
              builder: (_) => AlertDialog(
                title: const Text(
                  'Attention',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
                content: const Text(
                  'Are you sure you want to delete the task?',
                  textAlign: TextAlign.center,
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      BlocProvider.of<TodoCubit>(context).removeTodo(todo);
                      Navigator.pop(context);
                    },
                    child:
                        const Text('OK', style: TextStyle(color: Colors.green)),
                  ),
                ],
              ),
            );
          },
          child: Card(
            color: todo.isComplete ? Colors.greenAccent : Colors.red[200],
            child: CheckboxListTile(
              title: Text(
                todo.title,
                style: TextStyle(
                  fontSize: 18.0,
                  decoration:
                      todo.isComplete ? TextDecoration.lineThrough : null,
                ),
              ),
              value: todo.isComplete,
              onChanged: (newValue) {
                BlocProvider.of<TodoCubit>(context)
                    .updateTaskStatus(todo, newValue!);
              },
            ),
          ),
        );
      },
    );
  }
}
