import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoey/models/Todo.dart';
import 'package:todoey/todo_cubit.dart';

class TodosListView extends StatelessWidget {
  const TodosListView({
    Key? key,
    required this.todos,
  }) : super(key: key);

  final List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return Card(
          child: CheckboxListTile(
            title: Text(
              todo.title,
              style: TextStyle(
                decoration: todo.isComplete ? TextDecoration.lineThrough : null,
              ),
            ),
            value: todo.isComplete,
            onChanged: (newValue) {
              BlocProvider.of<TodoCubit>(context)
                  .updateTaskStatus(todo, newValue!);
            },
          ),
        );
      },
    );
  }
}
