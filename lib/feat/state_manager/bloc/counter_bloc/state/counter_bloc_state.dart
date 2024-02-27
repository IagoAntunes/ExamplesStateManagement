// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class ICounterBlocState {
  int count;
  ICounterBlocState({
    required this.count,
  });
}

class IncrementedCounterBlocState extends ICounterBlocState {
  IncrementedCounterBlocState({required super.count});
}

class DecrementedCounterBlocState extends ICounterBlocState {
  DecrementedCounterBlocState({required super.count});
}

class IdleCounterBlocState extends ICounterBlocState {
  IdleCounterBlocState({required super.count});
}
