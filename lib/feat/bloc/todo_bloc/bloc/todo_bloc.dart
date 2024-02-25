import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testando_coisas/core/models/todo_model.dart';
import 'package:testando_coisas/feat/bloc/todo_bloc/event/todo_bloc_event.dart';
import 'package:testando_coisas/feat/bloc/todo_bloc/state/todo_bloc_state.dart';

class TodoBloc extends Bloc<ITodoBlocEvent, ITodoBlocState> {
  List<TodoModel> listTodoOriginal = [];
  TodoBloc() : super(IdleTodoBlocState(listTodos: [])) {
    // Emitir o evento GetTodoBlocEvent assim que o bloc for instanciado
    on<AddTodoBlocEvent>((event, emit) {
      var todo = TodoModel(title: event.title, isChecked: false);
      listTodoOriginal.add(todo);
      emit(SuccessGetTodoBlocState(listTodos: listTodoOriginal));
    });

    on<GetTodoBlocEvent>(
      (event, emit) async {
        emit(LoadingGetTodoBlocState(listTodos: []));
        await Future.delayed(const Duration(seconds: 3));
        List<TodoModel> listPersons = [
          TodoModel(title: "Academia", isChecked: false),
          TodoModel(title: "Almoçar", isChecked: false),
          TodoModel(
              title: "Estudar",
              isChecked: false), // Corrigido "Estudaer" para "Estudar"
        ];
        listTodoOriginal.addAll(listPersons);
        emit(SuccessGetTodoBlocState(listTodos: listPersons));
      },
    );

    on<CheckTodoBlocEvent>((event, emit) {
      state.listTodos
          .where((element) => element.title == event.todo.title)
          .first
          .isChecked = event.value;
      listTodoOriginal
          .where((element) => element.title == event.todo.title)
          .first
          .isChecked = event.value;
      for (var item in state.listTodos) {
        print("OI -> ${item.title} -> ${item.isChecked}");
      }
      emit(SuccessGetTodoBlocState(listTodos: state.listTodos));
    });

    on<FilterTodoBlocEvent>(
      (event, emit) {
        if (event.text.isEmpty) {
          emit(SuccessGetTodoBlocState(listTodos: listTodoOriginal));
        } else {
          emit(
            SuccessGetTodoBlocState(
              listTodos: listTodoOriginal
                  .where((element) => element.title
                      .toLowerCase()
                      .contains(event.text.toLowerCase()))
                  .toList(),
            ),
          );
        }
      },
    );

    add(GetTodoBlocEvent());
  }
}
