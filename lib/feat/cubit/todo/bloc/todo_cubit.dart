import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testando_coisas/core/models/todo_model.dart';
import 'package:testando_coisas/feat/cubit/todo/state/todo_cubit_state.dart';

class TodoCubit extends Cubit<ITodoCubitState> {
  List<TodoModel> listTodos = [];
  TodoCubit() : super(IdleTodoCubitState(list: [])) {
    getTodos();
  }

  Future<void> getTodos() async {
    emit(LoadingTodoCubitState(list: []));
    await Future.delayed(const Duration(seconds: 3));
    listTodos.addAll([
      TodoModel(title: "Academia", isChecked: false),
      TodoModel(title: "Almoçar", isChecked: false),
      TodoModel(title: "Estudar", isChecked: false),
    ]);
    emit(LoadedTodoCubitState(list: listTodos));
  }

  void selectItem(TodoModel todo, bool value) {
    listTodos.where((element) => element.title == todo.title).first.isChecked =
        value;
    emit(LoadedTodoCubitState(list: listTodos));
  }

  void filterItems(String text) {
    var list = listTodos
        .where((element) =>
            element.title.toLowerCase().contains(text.toLowerCase()))
        .toList();
    emit(LoadedTodoCubitState(list: list));
  }

  void addTodo(String title) {
    var todo = TodoModel(title: title, isChecked: false);
    listTodos.add(todo);
    emit(LoadedTodoCubitState(list: listTodos));
  }
}
