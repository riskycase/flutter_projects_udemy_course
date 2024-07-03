import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/data/TodoItemLogic.dart';

class BottomSheetContainer extends StatefulWidget {
  const BottomSheetContainer({super.key});

  @override
  State<BottomSheetContainer> createState() => _BottomSheetContainerState();
}

class _BottomSheetContainerState extends State<BottomSheetContainer> {
  String taskName = '';
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Add task',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.lightBlueAccent,
              fontSize: 30.0,
            ),
          ),
          TextField(
            controller: textEditingController,
            textAlign: TextAlign.center,
            onChanged: (newText) {
              setState(() {
                taskName = newText;
              });
            },
            decoration: const InputDecoration(
                border: UnderlineInputBorder(
                    borderSide: BorderSide(
              color: Colors.lightBlueAccent,
            ))),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: FilledButton(
              onPressed: () {
                Provider.of<TodoItemList>(context, listen: false)
                    .addTodo(taskName);
                textEditingController.clear();
                Navigator.pop(context);
              },
              child: const Text(
                'ADD TASK',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
