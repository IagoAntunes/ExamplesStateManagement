// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
part 'counter_store.store.g.dart';

//Modo sem usar CodeGen
class CounterStore2 with Store {
  CounterStore2() {
    increment = Action(_increment);
    decrement = Action(_decrement);
  }
  final _count = Observable(0);
  int get count => _count.value;

  set count(int newValue) => _count.value = newValue;
  late Action increment;
  late Action decrement;

  void _increment() {
    _count.value++;
  }

  void _decrement() {
    _count.value--;
  }
}

//Modo usando CodeGen
class CounterStore = _CounterStore with _$CounterStore;

abstract class _CounterStore with Store {
  @observable
  int count = 0;

  @action
  void increment() {
    count++;
  }

  @action
  void decrement() {
    count--;
  }
}
