import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/counter_cubit_state.dart';

class CounterCubit extends Cubit<ICounterCubitState> {
  CounterCubit() : super(IdleCounterCubitState(count: 0));

  void increment() {
    emit(IncrementedCounterCubitState(count: state.count + 1));
  }

  void decrement() {
    emit(IncrementedCounterCubitState(count: state.count - 1));
  }
}
