abstract class ICounterCubitState {
  int count;
  ICounterCubitState({
    required this.count,
  });
}

class IncrementedCounterCubitState extends ICounterCubitState {
  IncrementedCounterCubitState({required super.count});
}

class DecrementedCounterCubitState extends ICounterCubitState {
  DecrementedCounterCubitState({required super.count});
}

class IdleCounterCubitState extends ICounterCubitState {
  IdleCounterCubitState({required super.count});
}
