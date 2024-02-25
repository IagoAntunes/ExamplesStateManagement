import '../../../../core/models/todo_model.dart';

abstract class ITodoBlocEvent {}

class GetTodoBlocEvent extends ITodoBlocEvent {}

class AddTodoBlocEvent extends ITodoBlocEvent {
  String title;
  AddTodoBlocEvent({
    required this.title,
  });
}

class CheckTodoBlocEvent extends ITodoBlocEvent {
  TodoModel todo;
  bool value;
  CheckTodoBlocEvent({
    required this.todo,
    required this.value,
  });
}

class FilterTodoBlocEvent extends ITodoBlocEvent {
  String text;
  FilterTodoBlocEvent({
    required this.text,
  });
}
