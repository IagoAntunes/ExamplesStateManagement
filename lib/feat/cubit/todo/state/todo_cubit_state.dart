import 'package:testando_coisas/core/models/todo_model.dart';

abstract class ITodoCubitState {
  List<TodoModel> list;
  ITodoCubitState({
    required this.list,
  });
}

class IdleTodoCubitState extends ITodoCubitState {
  IdleTodoCubitState({required super.list});
}

class LoadingTodoCubitState extends ITodoCubitState {
  LoadingTodoCubitState({required super.list});
}

class LoadedTodoCubitState extends ITodoCubitState {
  LoadedTodoCubitState({required super.list});
}

class FailureTodoCubitState extends ITodoCubitState {
  FailureTodoCubitState({required super.list});
}
