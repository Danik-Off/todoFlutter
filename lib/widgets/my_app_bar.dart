import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget{
  const MyAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(56.0);
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("todo-Flutter"),
    );
  }
}