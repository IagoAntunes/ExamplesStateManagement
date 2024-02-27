abstract class IFormCubitState {}

class IdleFormCubitState extends IFormCubitState {}

class LoadingFormCubitState extends IFormCubitState {}

abstract class IFormCubitListeners extends IFormCubitState {
  String message;
  IFormCubitListeners({
    required this.message,
  });
}

class LoggedFormCubitStateListener extends IFormCubitListeners {
  LoggedFormCubitStateListener({required super.message});
}

class FailureFormCubitStateListener extends IFormCubitListeners {
  FailureFormCubitStateListener({required super.message});
}
