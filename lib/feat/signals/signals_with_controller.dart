import 'dart:async';

import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:testando_coisas/feat/signals/signals_form.dart';

class User {
  String name;
  String email;
  User({
    required this.name,
    required this.email,
  });
}

class LoginControlle {
  final user = signal<User?>(null);
  late final isLoggedIn = computed(() => user() is User);
  final loading = signal(false);

  login() async {
    loading.value = true;
    await Future.delayed(const Duration(seconds: 3));
    user.value = User(name: "Joao", email: "Joao@gmail.com");
    loading.value = false;
  }

  logout() {
    user.value = null;
  }
}

class SignalsWithController extends StatefulWidget {
  SignalsWithController({super.key});

  @override
  State<SignalsWithController> createState() => _SignalsWithControllerState();
}

class _SignalsWithControllerState extends State<SignalsWithController> {
  final controller = LoginControlle();
  late final void Function() disposer;

  @override
  void initState() {
    super.initState();
    disposer = effect(
      () {
        if (controller.isLoggedIn()) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => FormSignals(),
            ),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        child: Center(
          child: Watch(
            (_) {
              return switch (controller.loading.value) {
                true => const CircularProgressIndicator(),
                false => FilledButton(
                    onPressed: controller.login,
                    child: const Text("Login"),
                  ),
                _ => const Text("Default")
              };
            },
          ),
        ),
      ),
    );
  }
}
