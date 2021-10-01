import 'package:amplify_flutter/amplify.dart';
import 'package:todoey/models/Todo.dart';
// import 'package:todoey/widgets/todos_list_view.dart';

class TodoRepository {
  Future<List<Todo>> getTodos() async {
    try {
      final todos = await Amplify.DataStore.query(Todo.classType);
      return todos;
    } catch (e) {
      throw e;
    }
  }

  Future<void> createTodo(String title) async {
    final newTodo = Todo(title: title, isComplete: false);
    try {
      await Amplify.DataStore.save(newTodo);
    } catch (e) {
      throw e;
    }
  }

  Future<void> updateTodoIsComplete(Todo todo, bool isComplete) async {
    final updateTodo = todo.copyWith(isComplete: isComplete);
    try {
      await Amplify.DataStore.save(updateTodo);
    } catch (e) {
      throw e;
    }
  }

  void removeTodo(Todo id) => Amplify.DataStore.delete(id);
}
