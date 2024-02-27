import 'package:flutter/material.dart';
import 'package:testando_coisas/feat/state_manager/changenotifier/form/state/form_changenotifier_state.dart';

class FormChangeNotifierController extends ChangeNotifier {
  IFormChangeNotifierState state = IdleFormChangeNotifierState();

  void doLogin(String email, String password) async {
    state = LoadingFormChangeNotifierState();
    notifyListeners();
    await Future.delayed(const Duration(seconds: 3));
    state = LoggedFormChangeNotifierState();
    notifyListeners();
  }
}
