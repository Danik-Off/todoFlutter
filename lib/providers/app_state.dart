import 'package:flutter/material.dart';
import 'package:todo_flutter/models/task.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "dart:convert";

class AppState with ChangeNotifier {
  List<Task> tasks = [
  ];

  String filter = "all";

 void saveArray(List<Task> _tasks) async {
  final prefs = await SharedPreferences.getInstance();
  final encodedArray = json.encode(_tasks.map((task) => task.toJson()).toList());
  prefs.setString('myArray', encodedArray);
}

void loadArray() async {
  final prefs = await SharedPreferences.getInstance();
  final encodedArray = prefs.getString('myArray');

  if (encodedArray != null) {
    final decodedArray = json.decode(encodedArray);
    tasks = List<Task>.from(decodedArray.map((json) => Task.fromJson(json)));
     notifyListeners();
  } else {
    print('Array is not set.');
  }
}
  List<Task> getFilteredTasks() {
    List<Task> filteredTasks = [];
    switch (filter) {
      case "incomplete":
        filteredTasks = tasks.where((task) => !task.done).toList();
        break;
      case "completed":
        filteredTasks = tasks.where((task) => task.done).toList();
        break;
      default:
        filteredTasks = tasks;
        break;
    }
    return filteredTasks;
  }

  void setFilter(String _filter) {
    filter = _filter;
    notifyListeners();
  }

  void addTask(String text) {
    tasks.add(Task(id: tasks.length + 1, text: text, done: false));
    notifyListeners();
    saveArray(tasks);
  }

  void setStatus(int id, bool status) {
    final taskIndex = tasks.indexWhere((task) => task.id == id);
    if (taskIndex != -1) {
      tasks[taskIndex].done = status;
      notifyListeners();
      saveArray(tasks);
    }
  }

  void removeTask(int id) {
    tasks.removeWhere((task) => task.id == id);
    notifyListeners();
    saveArray(tasks);
  }

  Task? getTaskById() {}
}
