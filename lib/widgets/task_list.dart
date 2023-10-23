import 'package:flutter/material.dart';
import 'package:todo_flutter/models/task.dart';
import 'package:todo_flutter/providers/app_state.dart';
import './task_item.dart';
import 'package:provider/provider.dart';

class Tasklist extends StatefulWidget {
  Tasklist({super.key});

  @override
  State<Tasklist> createState() => _TasklistState();
}

class _TasklistState extends State<Tasklist> {
 
  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (context, taskProvider, child) {
       List tasks = taskProvider.getTasks();
      return ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (BuildContext context, int index) {
         
          return TaskItem(task: tasks[index], id: index,);
        },
      );
    });
  }
}
