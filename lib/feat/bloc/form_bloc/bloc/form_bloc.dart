import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testando_coisas/feat/bloc/form_bloc/event/form_bloc_event.dart';
import 'package:testando_coisas/feat/bloc/form_bloc/state/form_bloc_state.dart';

class FormBloc extends Bloc<IFormBlocEvent, IFormBlocState> {
  FormBloc() : super(IdleFormBlocState(message: '')) {
    on<LoginFormBlocEvent>((event, emit) {
      if (event.email.isNotEmpty && event.password.isNotEmpty) {
        emit(SuccessFormBlocState(message: 'Logado com sucesso'));
      } else {
        emit(ErrorFormBlocState(message: 'Login ou senha invalidos'));
      }
    });
  }
}
