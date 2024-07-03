import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/components/BottomSheetContainer.dart';

import 'data/TodoItemLogic.dart';
import 'screens/TasksScreen.dart';

void main() => runApp(ChangeNotifierProvider<TodoItemList>(
      create: (BuildContext context) => TodoItemList(),
      child: Todoey(),
    ));

class Todoey extends StatefulWidget {
  const Todoey({super.key});

  @override
  State<Todoey> createState() => _TodoeyState();
}

class _TodoeyState extends State<Todoey> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.lightBlueAccent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          padding: EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 30.0,
          ),
        ),
      ),
      home: TodoeyOld(),
    );
  }
}

class TodoeyOld extends StatelessWidget {
  TodoeyOld({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: TasksScreen(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return const BottomSheetContainer();
              });
        },
        isExtended: true,
        backgroundColor: Colors.lightBlueAccent,
        // shape: CircleBorder(),
        icon: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        label: const Text(
          'ADD',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
