import 'package:testando_coisas/core/models/todo_model.dart';

abstract class ITodoBlocState {
  List<TodoModel> listTodos;
  ITodoBlocState({
    required this.listTodos,
  });
}

class IdleTodoBlocState extends ITodoBlocState {
  IdleTodoBlocState({required super.listTodos});
}

abstract class IGetedTodoBlocState extends ITodoBlocState {
  IGetedTodoBlocState({required super.listTodos});
}

class LoadingGetTodoBlocState extends IGetedTodoBlocState {
  LoadingGetTodoBlocState({required super.listTodos});
}

class SuccessGetTodoBlocState extends IGetedTodoBlocState {
  SuccessGetTodoBlocState({required super.listTodos});
}

class AddedTodoBlocState extends ITodoBlocState {
  AddedTodoBlocState({required super.listTodos});
}

class CheckedTodoBlocState extends ITodoBlocState {
  CheckedTodoBlocState({required super.listTodos});
}

class FilterTodoBlocState extends ITodoBlocState {
  FilterTodoBlocState({required super.listTodos});
}
