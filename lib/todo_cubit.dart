import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoey/models/Todo.dart';
import 'package:todoey/repository/todo_repositiry.dart';

abstract class TodoState {}

class LoadingTodos extends TodoState {}

class ListTodosSuccess extends TodoState {
  final List<Todo> todos;

  ListTodosSuccess({required this.todos});
}

class ListTodosFailure extends TodoState {
  final Exception exception;

  ListTodosFailure({required this.exception});
}

class TodoCubit extends Cubit<TodoState> {
  final _todoRepo = TodoRepository();

  TodoCubit() : super(LoadingTodos());

  void getTodos() async {
    if (state is ListTodosSuccess == false) {
      emit(LoadingTodos());
    }

    try {
      final todos = await _todoRepo.getTodos();
      emit(ListTodosSuccess(todos: todos));
    } catch (e) {
      if (e is Exception) emit(ListTodosFailure(exception: e));
    }
  }

  void createTodo(String title) async {
    await _todoRepo.createTodo(title);
    getTodos();
  }

  void updateTaskStatus(Todo todo, bool isComplete) async {
    await _todoRepo.updateTodoIsComplete(todo, isComplete);
    getTodos();
  }

  void removeTodo(Todo id) {
    _todoRepo.removeTodo(id);
    getTodos();
  }
}




// void deleteTask(Task task) {
//   _tasks.remove(task);
//   notifyListeners();
// }
