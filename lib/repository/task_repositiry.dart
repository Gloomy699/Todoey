import 'package:amplify_flutter/amplify.dart';
import 'package:todoey/models/Todo.dart';

class TaskRepository {
  Future<List<Todo>> getTasks() async {
    try {
      final todos = await Amplify.DataStore.query(Todo.classType);
      return todos;
    } catch (e) {
      throw e;
    }
  }

  Future<void> addTask(String title) async {
    final newTask = Todo(title: title, isComplete: false);
    try {
      await Amplify.DataStore.save(newTask);
    } catch (e) {
      throw e;
    }
  }

  void updateTaskStatus(Todo todo, bool isComplete) async {
    final updateTask = todo.copyWith(isComplete: isComplete);
    try {
      await Amplify.DataStore.save(updateTask);
    } catch (e) {
      throw e;
    }
  }

  // Future<List<Todo>> deleteTask() async {
  //   try {
  //     final todos = await Amplify.DataStore.delete();
  //     return;
  //   } catch (e) {
  //     throw e;
  //   }
  // }
}
