import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/data/TodoItemLogic.dart';

class TodoItem extends StatelessWidget {
  final int index;

  const TodoItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    TodoItemList todoItemList = Provider.of<TodoItemList>(
      context,
      listen: false,
    );
    return GestureDetector(
      onLongPress: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Delete task?'),
                content: Text(
                    "Task '${todoItemList.getTodoTitle(index)}' will be deleted from the todo list!"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('CANCEL'),
                  ),
                  TextButton(
                    onPressed: () {
                      todoItemList.deleteItem(index);
                      Navigator.pop(context);
                    },
                    child: const Text('OK'),
                  )
                ],
              )),
      child: ListTile(
          title: Text(
            todoItemList.getTodoTitle(index),
            style: TextStyle(
              decoration: todoItemList.getTodoStatus(index)
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ),
          ),
          trailing: Checkbox(
            value: todoItemList.getTodoStatus(index),
            onChanged: (status) => todoItemList.setTodoStatus(index, status!),
            activeColor: Colors.lightBlueAccent,
          )),
    );
  }
}
