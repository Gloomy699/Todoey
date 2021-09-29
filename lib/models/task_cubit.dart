import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoey/models/Todo.dart';
import 'package:todoey/repository/task_repositiry.dart';

abstract class TaskState {}

class LoadingTask extends TaskState {}

class ListTasksSuccess extends TaskState {
  final List<Todo> todos;

  ListTasksSuccess({required this.todos});
}

class ListTaskFailure extends TaskState {
  final Exception exception;

  ListTaskFailure({required this.exception});
}

class TaskCubit extends Cubit<TaskState> {
  final _taskRepo = TaskRepository();

  TaskCubit() : super(LoadingTask());

  void getTasks() async {
    if (state is ListTasksSuccess == false) {
      emit(LoadingTask());
    }
    try {
      final todos = await _taskRepo.getTasks();
      emit(ListTasksSuccess(todos: todos));
    } catch (e) {
      // emit(ListTaskFailure(exception: e));
    }
  }

  void addTask(String title) {}

  void updateTaskStatus(Todo todo, bool isComplete) {}

  // void deleteTask() {}
}


//   int get taskCount => _tasks.length;

// void addTask(String newTaskTitle) {
//   final task = Task(name: newTaskTitle);
//   _tasks.add(task);
//   notifyListeners();
// }

// void updateTaskStatus(Task task) {
//   task.toggleDone();
//   notifyListeners();
// }

// void deleteTask(Task task) {
//   _tasks.remove(task);
//   notifyListeners();
// }
