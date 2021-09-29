import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoey/models/Todo.dart';
import 'package:todoey/models/task_cubit.dart';
// import 'package:todoey/models/task_cubit.dart';
import 'package:todoey/screens/add_task_screen.dart';
import 'package:todoey/widgets/loading_view.dart';
// import 'package:todoey/widgets/tasks_list.dart';
// import 'package:provider/provider.dart';
import '../constans.dart';

class TasksScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => AddTaskScreen(
                newTaskTitle: '',
              ),
            );
          },
          backgroundColor: primaryColor,
          child: Icon(
            Icons.add,
            size: 35.0,
          ),
        ),
        body: BlocBuilder<TaskCubit, TaskState>(builder: (context, state) {
          if (state is ListTasksSuccess) {
            return state.todos.isEmpty
                ? _emptyTodosView()
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
                            //   '${Provider.of<TaskData>(context).taskCount} Tasks',
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
                          // child: TasksList(),
                        ),
                      ),
                    ],
                  );
          } else if (state is ListTaskFailure) {
            return _exceptionView(state.exception);
          } else {
            return LoadingView();
          }
        }));
  }

  Widget _emptyTodosView() {
    return Center(
      child: Text('No todos yet'),
    );
  }

  Widget _exceptionView(Exception exception) {
    return Center(child: Text(exception.toString()));
  }

  Widget _todosListView(List<Todo> todos) {
    return ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final todo = todos[index];
          return Card(
              child: CheckboxListTile(
                  title: Text(todo.title),
                  value: todo.isComplete,
                  onChanged: (newValue) {
                    BlocProvider.of<TaskCubit>(context)
                        .updateTaskStatus(todo, newValue);
                  }));
        });
  }
}
