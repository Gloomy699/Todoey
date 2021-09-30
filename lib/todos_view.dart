import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoey/constans.dart';
import 'package:todoey/widgets/empty_view.dart';
import 'package:todoey/widgets/todos_list_view.dart';
import 'package:todoey/todo_cubit.dart';
import 'package:todoey/screens/add_task_view.dart';
import 'widgets/loading_view.dart';

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
                            _titleController.text = '';
                          },
                        ));
              }),
          // floatingActionButton: FloatingActionButton(
          //     child: Icon(Icons.add),
          //     onPressed: () {
          //       showModalBottomSheet(
          //           context: context, builder: (context) => newTodoView());
          //     }),
          body:
              // BlocBuilder<TodoCubit, TodoState>(
              //   builder: (_, state) {
              newMethod(state),
          // },
        );
        // );
      },
    );
  }

  Widget newMethod(TodoState state) {
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
                      // Text(
                      //   '${BlocProvider.of<TaskCubit>(context).TaskState.length} Tasks',
                      //   style: TextStyle(
                      //     color: secondaryColor,
                      //     fontSize: 18.0,
                      //   ),
                      // ),
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
    return Center(child: Text(exception.toString()));
  }

  // Widget newTodoView() {
  //   return Container(
  //     color: Color(0xFF757575),
  //     child: Container(
  //       decoration: BoxDecoration(
  //         color: secondaryColor,
  //         borderRadius: BorderRadius.only(
  //           topLeft: Radius.circular(30.0),
  //           topRight: Radius.circular(30.0),
  //         ),
  //       ),
  //       child: Padding(
  //         padding: EdgeInsets.only(top: 20.0, left: 50.0, right: 50.0),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.stretch,
  //           children: <Widget>[
  //             SizedBox(
  //               height: 20.0,
  //             ),
  //             Text(
  //               'Add Todo',
  //               textAlign: TextAlign.center,
  //               style: TextStyle(
  //                 color: primaryColor,
  //                 fontSize: 35.0,
  //                 fontWeight: FontWeight.w500,
  //               ),
  //             ),
  //             TextField(
  //               autofocus: true,
  //               textAlign: TextAlign.center,
  //               style: TextStyle(fontSize: 20.0),
  //               decoration: InputDecoration(hintText: 'Enter todo title'),
  //               controller: _titleController,
  //             ),
  //             SizedBox(
  //               height: 25.0,
  //             ),
  //             TextButton(
  //               style: TextButton.styleFrom(
  //                 backgroundColor: primaryColor,
  //               ),
  //               onPressed: () {
  //                 BlocProvider.of<TodoCubit>(context)
  //                     .createTodo(_titleController.text);
  //                 _titleController.text = '';
  //                 Navigator.of(context).pop();
  //               },
  //               child: Text(
  //                 'Add',
  //                 style: TextStyle(
  //                   color: secondaryColor,
  //                   fontSize: 20.0,
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
