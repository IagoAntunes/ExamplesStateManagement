// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_mobx_store.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FormMobxStore on _FormMobxStore, Store {
  Computed<bool>? _$isValidComputed;

  @override
  bool get isValid => (_$isValidComputed ??=
          Computed<bool>(() => super.isValid, name: '_FormMobxStore.isValid'))
      .value;

  late final _$emailAtom = Atom(name: '_FormMobxStore.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_FormMobxStore.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_FormMobxStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$doLoginAsyncAction =
      AsyncAction('_FormMobxStore.doLogin', context: context);

  @override
  Future doLogin() {
    return _$doLoginAsyncAction.run(() => super.doLogin());
  }

  late final _$_FormMobxStoreActionController =
      ActionController(name: '_FormMobxStore', context: context);

  @override
  dynamic onChangeEmail(String value) {
    final _$actionInfo = _$_FormMobxStoreActionController.startAction(
        name: '_FormMobxStore.onChangeEmail');
    try {
      return super.onChangeEmail(value);
    } finally {
      _$_FormMobxStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onChangePassword(String value) {
    final _$actionInfo = _$_FormMobxStoreActionController.startAction(
        name: '_FormMobxStore.onChangePassword');
    try {
      return super.onChangePassword(value);
    } finally {
      _$_FormMobxStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
isLoading: ${isLoading},
isValid: ${isValid}
    ''';
  }
}
