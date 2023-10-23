import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/models/task.dart';
import '../providers/app_state.dart';

class TaskItem extends StatefulWidget {
  final Task task;
  final int id;
  bool isChecked = false;

  TaskItem({super.key, required this.task, required this.id});

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (context, taskProvider, child) {
      return ListTile(
        leading: Checkbox(
          value: taskProvider.getTasks()[widget.id].done,
          onChanged: (newValue) {
            setState(() {
              taskProvider.setStatus(widget.id, newValue!);
            });
          },
        ),
        title: Text(
          widget.task.text,
          style: TextStyle(
            decoration: widget.task.done
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ),
        trailing: ElevatedButton(
            onPressed: () {
              taskProvider.removeTask(widget.id);
            },
            child: Icon(Icons.delete)),
      );
    });
  }
}
