import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/TodoItemLogic.dart';

class Appheader extends StatelessWidget {
  const Appheader({super.key});

  @override
  Widget build(BuildContext context) {
    TodoItemList todoItemList = Provider.of<TodoItemList>(context);
    return Padding(
      padding: const EdgeInsets.only(
          top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 60.0,
              child: Icon(
                Icons.list,
                size: 60.0,
                color: Colors.lightBlueAccent,
              ),
            ),
          ),
          const Text(
            'Todoey',
            style: TextStyle(
              color: Colors.white,
              fontSize: 48.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            '${todoItemList.getCount()} task${todoItemList.getCount() == 1 ? '' : 's'}, ${todoItemList.getCompletedCount()} done',
            style: const TextStyle(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
