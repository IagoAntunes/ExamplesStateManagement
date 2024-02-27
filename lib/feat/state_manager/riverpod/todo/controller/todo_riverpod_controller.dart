import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testando_coisas/core/models/todo_model.dart';
import 'package:testando_coisas/feat/state_manager/riverpod/todo/state/todo_riverpod_state.dart';

final todoRiverpodProvider = ChangeNotifierProvider(
  (ref) => TodoRiverpodController(IdleTodoRiverpodState()),
);

class TodoRiverpodController extends ValueNotifier<ITodoRiverpodState> {
  TodoRiverpodController(super._value) {
    getTodos();
  }

  List<TodoModel> listTodos = [];
  List<TodoModel> filterTodos = [];

  void getTodos() async {
    value = LoadingTodoRiverpodState();
    await Future.delayed(const Duration(seconds: 3));

    listTodos.addAll([
      TodoModel(title: "Academia", isChecked: false),
      TodoModel(title: "Almoçar", isChecked: false),
      TodoModel(title: "Estudar", isChecked: false)
    ]);
    filterTodos.addAll(listTodos);
    value = SuccessTodoRiverpodState();
  }

  void filterItems(String text) {
    var list = listTodos
        .where((element) =>
            element.title.toLowerCase().contains(text.toLowerCase()))
        .toList();
    filterTodos.clear();
    filterTodos.addAll(list);
    value = SuccessTodoRiverpodState();
  }

  void selectItem(TodoModel todo, bool valueChecked) {
    var selectedTodo = filterTodos
        .where((element) =>
            (element).title.toLowerCase() == todo.title.toLowerCase())
        .first;

    selectedTodo.isChecked = valueChecked;
    value = SuccessTodoRiverpodState();
  }

  void addTodo(String title) {
    var newTodo = TodoModel(title: title, isChecked: false);
    listTodos.add(newTodo);
    filterTodos.add(newTodo);
    value = SuccessTodoRiverpodState();
  }
}
