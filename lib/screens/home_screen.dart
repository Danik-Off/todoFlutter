import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import '../providers/app_state.dart';
import '../widgets/filter_task_list.dart';
import 'package:todo_flutter/widgets/my_app_bar.dart';
import "package:todo_flutter/widgets/task_list.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<AppState>(context);
    taskProvider.loadArray();
    return Scaffold(
        appBar: MyAppBar(),
        body: Column(
          children: [
            FilteredTaskList(),
            Expanded(
              child: TaskList(),
            ),
          ],
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(()=>{}),
        tooltip: 'Increment Counter',
        child: const Icon(Icons.add),
      ), 
        );
  }
}
