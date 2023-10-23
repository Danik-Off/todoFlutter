import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_flutter/models/task.dart';
import 'package:todo_flutter/providers/app_state.dart';
import './task_item.dart';
import 'package:provider/provider.dart';

class TaskList extends StatefulWidget {
  TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
 
  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (context, taskProvider, child) {
       List tasks = taskProvider.getFilteredTasks();
      return ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (BuildContext context, int index) {
          log(index);
          return TaskItem(task: tasks[index]);
        },
      );
    });
  }
}
