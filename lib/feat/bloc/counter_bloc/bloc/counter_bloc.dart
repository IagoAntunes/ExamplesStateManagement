import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testando_coisas/feat/bloc/counter_bloc/events/counter_bloc_events.dart';

import '../state/counter_bloc_state.dart';

class CounterBloc extends Bloc<ICounterBlocEvent, ICounterBlocState> {
  int count = 0;
  CounterBloc() : super(IdleCounterBlocState(count: 0)) {
    on<IncrementCounterBlocEvent>(
      (event, emit) {
        emit(IncrementedCounterBlocState(count: state.count + 1));
      },
    );
    on<DecrementCounterBlocEvent>((event, emit) {
      emit(DecrementedCounterBlocState(count: state.count - 1));
    });
  }
}
