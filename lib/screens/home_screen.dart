import "package:flutter/material.dart";
import 'package:todo_flutter/widgets/my_app_bar.dart';
import "package:todo_flutter/widgets/task_list.dart";
class HomeScreen extends StatefulWidget  {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Tasklist(),
    );
  }
}