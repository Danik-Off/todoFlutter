import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/providers/app_state.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  final TextEditingController _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<AppState>(context);
    String textData = "";
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              decoration: InputDecoration(labelText: 'Task Description'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final textData =
                    _textController.text.trim();
                if (textData.isNotEmpty) {
                  taskProvider.addTask(textData);
                  Navigator.of(context).pop();
                } else {
                  final snackBar = SnackBar(
                    content: Text('Text cannot be empty'),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              child: Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}
