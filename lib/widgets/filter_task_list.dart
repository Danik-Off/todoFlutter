import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/task.dart';
import '../providers/app_state.dart';

class FilteredTaskList extends StatefulWidget {
  const FilteredTaskList({super.key});

  @override
  State<FilteredTaskList> createState() => _FilteredTaskListState();
}

class _FilteredTaskListState extends State<FilteredTaskList> {
  @override
  Widget build(BuildContext context) {
   return Consumer<AppState>(
      builder: (context, taskProvider, child) {
        return DropdownButton<String>(
          value: taskProvider.filter,
          items: <DropdownMenuItem<String>>[
            DropdownMenuItem<String>(
              value: 'all',
              child: Text('Все задачи'),
            ),
            DropdownMenuItem<String>(
              value: 'completed',
              child: Text('Завершенные задачи'),
            ),
            DropdownMenuItem<String>(
              value: 'incomplete',
              child: Text('Незавершенные задачи'),
            ),
          ],
          onChanged: (newValue) {
          setState(() {
              taskProvider.setFilter(newValue!);
            }) ;
          },
        );
      },
    );
  }
}
