import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testando_coisas/feat/cubit/form/state/form_cubit_state.dart';

class FormCubit extends Cubit<IFormCubitState> {
  FormCubit() : super(IdleFormCubitState());

  void login(String email, String password) async {
    emit(LoadingFormCubitState());
    await Future.delayed(const Duration(seconds: 3));
    if (email.isNotEmpty && password.isNotEmpty) {
      emit(LoggedFormCubitStateListener(message: 'Logado com Sucesso'));
    } else {
      emit(FailureFormCubitStateListener(message: "Falha no Login"));
    }
  }
}
