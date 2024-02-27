import 'package:get/get.dart';
import 'package:testando_coisas/feat/state_manager/getx/todo/state/todo_getx_state.dart';

import '../../../../../core/models/todo_model.dart';

class TodoGetxController extends GetxController {
  TodoGetxController() {
    getTodos();
  }
  var state = Rx<ITodoGetxState>(IdleTodoGetxState());

  var listTodos = [].obs;
  var filterTodos = [].obs;

  void filterItems(String text) {
    var filteredList = listTodos
        .where((element) => (element as TodoModel)
            .title
            .toLowerCase()
            .contains(text.toLowerCase()))
        .toList();
    filterTodos.clear();
    filterTodos.addAll(filteredList);
    state.value = SuccessTodoGetxState();
  }

  void getTodos() async {
    state.value = LoadingTodoGetxState();
    await Future.delayed(const Duration(seconds: 3));
    listTodos.addAll([
      TodoModel(title: "aaaa", isChecked: false),
      TodoModel(title: "Almoçar", isChecked: false),
      TodoModel(title: "Estudar", isChecked: false),
    ]);
    filterTodos.addAll(listTodos);
    state.value = SuccessTodoGetxState();
  }

  void selectItem(TodoModel todo, bool value) {
    var selectedTodo = filterTodos
        .where((element) =>
            (element as TodoModel).title.toLowerCase() ==
            todo.title.toLowerCase())
        .first as TodoModel;

    selectedTodo.isChecked = value;
    state.value = SuccessTodoGetxState();
  }

  void addTodo(String title) {
    var newTodo = TodoModel(title: title, isChecked: false);
    listTodos.add(newTodo);
    filterTodos.add(newTodo);
  }
}
