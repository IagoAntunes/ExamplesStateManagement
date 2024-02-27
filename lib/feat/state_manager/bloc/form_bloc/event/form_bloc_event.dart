abstract class IFormBlocEvent {}

class LoginFormBlocEvent extends IFormBlocEvent {
  LoginFormBlocEvent({required this.email, required this.password});
  String email;
  String password;
}
