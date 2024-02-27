import 'package:get/get.dart';
import 'package:testando_coisas/feat/state_manager/getx/form/state/form_getx_state.dart';

class FormGetxController extends GetxController {
  var state = Rx<IFormGetxState>(IdleFormGetxState());

  Future<void> doLogin(String email, String password) async {
    state.value = LoadingFormGetxState();
    await Future.delayed(const Duration(seconds: 3));
    if (email.isNotEmpty && password.isNotEmpty) {
      state.value = LoggedFormGetxState();
    } else {
      state.value = FailureFormGetxState();
    }
  }
}
