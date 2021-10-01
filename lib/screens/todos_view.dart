import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoey/constans.dart';
import 'package:todoey/widgets/main_screen_update.dart';
import 'package:todoey/repository/todo_cubit.dart';
import 'package:todoey/screens/add_task_view.dart';

class TodosView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TodosViewState();
}

class _TodosViewState extends State<TodosView> {
  final _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoCubit, TodoState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: primaryColor,
          floatingActionButton: FloatingActionButton(
            backgroundColor: primaryColor,
            child: Icon(
              Icons.add,
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (_) => NewTodoView(
                  onSave: () {
                    BlocProvider.of<TodoCubit>(context)
                        .createTodo(_titleController.text);
                  },
                  titleController: _titleController,
                ),
              );
            },
          ),
          body: MainScreenUpdate(state: state),
        );
      },
    );
  }
}
