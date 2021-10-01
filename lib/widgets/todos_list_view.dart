import 'package:flutter/material.dart';
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
              builder: (BuildContext _) => AlertDialog(
                title: const Text('Alert'),
                content:
                    const Text('Are you sure you want to delete the task?'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      BlocProvider.of<TodoCubit>(context).removeTodo(todo);
                      Navigator.pop(context);
                    },
                    child: const Text('OK'),
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
