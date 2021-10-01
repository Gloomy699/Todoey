import 'package:flutter/material.dart';
import 'package:todoey/constans.dart';
import 'package:todoey/repository/todo_cubit.dart';
import 'package:todoey/screens/empty_view.dart';
import 'package:todoey/screens/loading_view.dart';
import 'package:todoey/widgets/todos_list_view.dart';

class MainScreenUpdate extends StatelessWidget {
  final TodoState state;
  MainScreenUpdate({required this.state});

  @override
  Widget build(BuildContext context) {
    Widget widget = Container();
    if (state is ListTodosSuccess) {
      widget = (state as ListTodosSuccess).todos.isEmpty
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
                        '${(state as ListTodosSuccess).todos.length} Tasks',
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
                    child:
                        TodosListView(todos: (state as ListTodosSuccess).todos),
                  ),
                ),
              ],
            );
    } else if (state is ListTodosFailure) {
      widget = Center(
        child: Text(
          (state as ListTodosFailure).exception.toString(),
        ),
      );
    } else {
      widget = LoadingView();
    }
    return widget;
  }
}
