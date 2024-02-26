import 'package:mobx/mobx.dart';
import 'package:testando_coisas/core/models/todo_model.dart';
import 'package:testando_coisas/feat/mobx/todo/state/todo_mobx_state.dart';
part 'todo_mobx_store.store.g.dart';

class TodoMobxStore = _TodoMobxStore with _$TodoMobxStore;

abstract class _TodoMobxStore with Store {
  _TodoMobxStore() {
    getTodos();
  }

  @observable
  List<TodoModel> listTodos = [];
  @observable
  List<TodoModel> listFilterTodos = [];
  @observable
  ITodoMobxState state = IdleTodoMobxState();

  @action
  Future<void> getTodos() async {
    state = LoadingTodoMobxMobxState();
    await Future.delayed(const Duration(seconds: 3));
    listTodos.addAll([
      TodoModel(title: "Academia", isChecked: false),
      TodoModel(title: "Almoçar", isChecked: false),
      TodoModel(title: "Estudar", isChecked: false),
    ]);
    listFilterTodos.addAll(listTodos);
    state = SuccessTodoMobxMobxState();
  }

  @action
  void filterItems(String text) {
    listFilterTodos = listTodos
        .where((element) =>
            element.title.toLowerCase().contains(text.toLowerCase()))
        .toList();
    state = SuccessTodoMobxMobxState();
  }

  @action
  void selectItem(TodoModel todo, bool value) {
    listFilterTodos
        .where((element) => element.title == todo.title)
        .first
        .isChecked = value;
    state = SuccessTodoMobxMobxState();
  }

  @action
  void addTodo(String title) {
    var newTodo = TodoModel(title: title, isChecked: false);
    listTodos.add(newTodo);
    listFilterTodos.add(newTodo);
    state = SuccessTodoMobxMobxState();
  }
}
