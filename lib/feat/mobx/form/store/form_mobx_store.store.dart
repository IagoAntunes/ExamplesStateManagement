// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
part 'form_mobx_store.store.g.dart';

class FormMobxStore = _FormMobxStore with _$FormMobxStore;

abstract class _FormMobxStore with Store {
  @observable
  String email = '';
  @observable
  String password = '';
  @observable
  bool isLoading = false;

  @computed
  bool get isValid => email.isNotEmpty && password.isNotEmpty;

  @action
  onChangeEmail(String value) {
    email = value;
  }

  @action
  onChangePassword(String value) {
    password = value;
  }

  @action
  doLogin() async {
    isLoading = true;
    await Future.delayed(const Duration(seconds: 3));
    isLoading = false;
  }
}
