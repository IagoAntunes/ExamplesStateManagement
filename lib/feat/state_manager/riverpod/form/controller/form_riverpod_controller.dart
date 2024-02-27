import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testando_coisas/feat/state_manager/riverpod/form/state/form_riverpod_state.dart';

final formRiverpodProvider = ChangeNotifierProvider(
  (ref) => FormRiverpodController(IdleFormRiverpodState()),
);

class FormRiverpodController extends ValueNotifier<IFormRiverpodState> {
  FormRiverpodController(super._value);

  Future<void> doLogin(String email, String password) async {
    value = LoadingFormRiverpodState();
    await Future.delayed(const Duration(seconds: 3));
    if (email.isNotEmpty && password.isNotEmpty) {
      value = LoggedFormRiverpodState();
    } else {
      value = FailureFormRiverpodState();
    }
  }
}
