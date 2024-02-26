import 'package:flutter/material.dart';
import 'package:testando_coisas/feat/changenotifier/todo/state/todo_changenotifier_state.dart';

import '../../../../core/models/todo_model.dart';

class TodoChangeNotifierController extends ChangeNotifier {
  TodoChangeNotifierController() {
    getTodos();
  }
  ITodoChangeNotifierState state = IdleTodoChangeNotifierState();

  List<TodoModel> listTodos = [];
  List<TodoModel> filterList = [];

  void getTodos() async {
    state = LoadingTodoChangeNotifierState();
    notifyListeners();
    await Future.delayed(const Duration(seconds: 3));
    listTodos.addAll([
      TodoModel(title: "Academia", isChecked: false),
      TodoModel(title: "Almoçar", isChecked: false),
      TodoModel(title: "Estudar", isChecked: false),
    ]);
    filterList.addAll(listTodos);
    state = SuccessTodoChangeNotifierState();
    notifyListeners();
  }

  void addTodo(String title) {
    var newTodo = TodoModel(title: title, isChecked: false);
    listTodos.add(newTodo);
    filterList.add(newTodo);
    notifyListeners();
  }

  void filterTodos(String text) {
    filterList = listTodos
        .where((element) =>
            element.title.toLowerCase().contains(text.toLowerCase()))
        .toList();
    notifyListeners();
  }

  void selectItem(TodoModel todo, bool value) {
    filterList.where((element) => element.title == todo.title).first.isChecked =
        value;
    notifyListeners();
  }
}
