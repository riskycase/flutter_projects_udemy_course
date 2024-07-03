import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/components/TodoItem.dart';

import '../data/TodoItemLogic.dart';

class TaskList extends StatelessWidget {
  TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          color: Colors.white,
        ),
        padding: const EdgeInsets.only(top: 30.0),
        child: ListView.builder(
          itemBuilder: (context, index) => TodoItem(index: index),
          itemCount: Provider.of<TodoItemList>(context).getCount(),
        ),
      ),
    );
  }
}
