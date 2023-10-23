import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/models/task.dart';
import 'package:todo_flutter/providers/app_state.dart';


class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.task});
  final Task task;
 
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<AppState>(context);
   
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Task: ${task.text}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text('Status: ${task.done ? 'Completed' : 'Incomplete'}'),
            
          ],
        ),
      ),
    );
  }
}