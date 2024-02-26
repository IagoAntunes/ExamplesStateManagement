// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_mobx_store.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TodoMobxStore on _TodoMobxStore, Store {
  late final _$listTodosAtom =
      Atom(name: '_TodoMobxStore.listTodos', context: context);

  @override
  List<TodoModel> get listTodos {
    _$listTodosAtom.reportRead();
    return super.listTodos;
  }

  @override
  set listTodos(List<TodoModel> value) {
    _$listTodosAtom.reportWrite(value, super.listTodos, () {
      super.listTodos = value;
    });
  }

  late final _$listFilterTodosAtom =
      Atom(name: '_TodoMobxStore.listFilterTodos', context: context);

  @override
  List<TodoModel> get listFilterTodos {
    _$listFilterTodosAtom.reportRead();
    return super.listFilterTodos;
  }

  @override
  set listFilterTodos(List<TodoModel> value) {
    _$listFilterTodosAtom.reportWrite(value, super.listFilterTodos, () {
      super.listFilterTodos = value;
    });
  }

  late final _$stateAtom = Atom(name: '_TodoMobxStore.state', context: context);

  @override
  ITodoMobxState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(ITodoMobxState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$getTodosAsyncAction =
      AsyncAction('_TodoMobxStore.getTodos', context: context);

  @override
  Future<void> getTodos() {
    return _$getTodosAsyncAction.run(() => super.getTodos());
  }

  late final _$_TodoMobxStoreActionController =
      ActionController(name: '_TodoMobxStore', context: context);

  @override
  void filterItems(String text) {
    final _$actionInfo = _$_TodoMobxStoreActionController.startAction(
        name: '_TodoMobxStore.filterItems');
    try {
      return super.filterItems(text);
    } finally {
      _$_TodoMobxStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectItem(TodoModel todo, bool value) {
    final _$actionInfo = _$_TodoMobxStoreActionController.startAction(
        name: '_TodoMobxStore.selectItem');
    try {
      return super.selectItem(todo, value);
    } finally {
      _$_TodoMobxStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listTodos: ${listTodos},
listFilterTodos: ${listFilterTodos},
state: ${state}
    ''';
  }
}
