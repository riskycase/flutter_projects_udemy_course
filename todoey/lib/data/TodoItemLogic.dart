import 'package:flutter/material.dart';

class TodoItemList extends ChangeNotifier {
  List<_TodoItem> _todoList = [];

  int getCount() {
    return _todoList.length;
  }

  int getCompletedCount() {
    return _todoList.where((item) => item.getDone()).length;
  }

  void addTodo(String title) {
    _todoList.add(_TodoItem(title));
    notifyListeners();
  }

  String getTodoTitle(int index) {
    return _todoList[index].getTitle();
  }

  bool getTodoStatus(int index) {
    return _todoList[index].getDone();
  }

  void setTodoStatus(int index, bool status) {
    _todoList[index].setDone(status);
    notifyListeners();
  }

  void deleteItem(int index) {
    _todoList.removeAt(index);
    notifyListeners();
  }
}

class _TodoItem {
  final String _title;
  bool _done = false;

  _TodoItem(this._title);

  void setDone(bool status) {
    this._done = status;
  }

  bool getDone() {
    return this._done;
  }

  String getTitle() {
    return this._title;
  }
}
