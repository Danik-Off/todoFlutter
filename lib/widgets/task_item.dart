import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/models/task.dart';
import 'package:todo_flutter/screens/detail_screen.dart';
import '../providers/app_state.dart';

class TaskItem extends StatefulWidget {
  final Task task;
  bool isChecked = false;

  TaskItem({super.key, required this.task});

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (context, taskProvider, child) {
      return ListTile(
        leading: Checkbox(
          value: widget.task.done,
          onChanged: (newValue) {
            setState(() {
              taskProvider.setStatus(widget.task.id, newValue!);
            });
          },
        ),
        title: OutlinedButton(child: Text(
          widget.task.text,
          style: TextStyle(
            decoration: widget.task.done
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ), onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailScreen(task: widget.task,)),
            );
          },) ,
        trailing: ElevatedButton(
            onPressed: () {
              taskProvider.removeTask(widget.task.id);
            },
            child: Icon(Icons.delete)),
      );
    });
  }
}
