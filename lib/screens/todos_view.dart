import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoey/constans.dart';
import 'package:todoey/screens/empty_view.dart';
import 'package:todoey/widgets/todos_list_view.dart';
import 'package:todoey/repository/todo_cubit.dart';
import 'package:todoey/screens/add_task_view.dart';
import 'loading_view.dart';

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
            child: Icon(Icons.add),
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
          body: todoScreenUpdate(state),
        );
      },
    );
  }

  Widget todoScreenUpdate(TodoState state) {
    if (state is ListTodosSuccess) {
      return state.todos.isEmpty
          ? EmptyView()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: 60.0,
                    left: 30.0,
                    right: 30.0,
                    bottom: 30.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: secondaryColor,
                        radius: 30.0,
                        child: Icon(
                          Icons.list,
                          size: 40.0,
                          color: primaryColor,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Todoey',
                        style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.w700,
                          color: secondaryColor,
                        ),
                      ),
                      Text(
                        '${state.todos.length} Tasks',
                        style: TextStyle(
                          color: secondaryColor,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                    ),
                    child: TodosListView(todos: state.todos),
                  ),
                ),
              ],
            );
    } else if (state is ListTodosFailure) {
      return exceptionView(state.exception);
    } else {
      return LoadingView();
    }
  }

  Widget exceptionView(Exception exception) {
    return Center(
      child: Text(
        exception.toString(),
      ),
    );
  }
}
