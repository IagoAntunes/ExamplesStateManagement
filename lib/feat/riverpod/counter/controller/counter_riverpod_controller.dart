import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterRiverpodProvider =
    ChangeNotifierProvider((ref) => CounterRiverpodController(0));

class CounterRiverpodController extends ValueNotifier<int> {
  CounterRiverpodController(super.value);

  void increment() {
    value++;
  }

  void decrement() {
    value--;
  }
}
