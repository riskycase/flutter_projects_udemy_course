import 'package:flutter/material.dart';
import 'package:todoey/components/AppHeader.dart';
import 'package:todoey/components/TaskList.dart';

class TasksScreen extends StatelessWidget {
  TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Appheader(),
        TaskList(),
      ],
    );
  }
}
