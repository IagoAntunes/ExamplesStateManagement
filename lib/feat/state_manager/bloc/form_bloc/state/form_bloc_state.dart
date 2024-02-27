abstract class IFormBlocState {
  String message;
  IFormBlocState({
    required this.message,
  });
}

class IdleFormBlocState extends IFormBlocState {
  IdleFormBlocState({required super.message});
}

class SuccessFormBlocState extends IFormBlocState {
  SuccessFormBlocState({required super.message});
}

class ErrorFormBlocState extends IFormBlocState {
  ErrorFormBlocState({required super.message});
}
