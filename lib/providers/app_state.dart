import 'package:flutter/material.dart';
import 'package:todo_flutter/models/task.dart';

class AppState with ChangeNotifier {
  List<Task> tasks = [new Task(text: "2", done: false),new Task(text: "3", done: false),new Task(text: "1", done: false)];
  String filter = "incomplete";

  List<Task> getTasks() {
    List<Task> filtredTasks =[];
    switch (filter) {
      case "incomplete":
          filtredTasks = tasks.where((task) => !task.done).toList();
        break;
      case "completed":
        filtredTasks = tasks.where((task) => task.done).toList();
        break;
      default:
        filtredTasks = tasks;
        break;
    
    }
    // notifyListeners();
    return filtredTasks;
  }

  void addTask(String text) {
    tasks.add(new Task(text: text, done: false));
    notifyListeners();
  }

  void setStatus(int id, bool status) {
    tasks[id].done = status;
    notifyListeners();
  }

  void removeTask(int index) {
    tasks.removeAt(index);
    notifyListeners();
  }
}
