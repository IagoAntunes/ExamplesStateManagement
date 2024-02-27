import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testando_coisas/core/components/custom_button_component.dart';
import 'package:testando_coisas/feat/riverpod/form/controller/form_riverpod_controller.dart';
import 'package:testando_coisas/feat/riverpod/form/state/form_riverpod_state.dart';

import '../../../../core/components/custom_textfield_component.dart';
import '../../../../core/page/default_form_page.dart';

class FormRiverpodPage extends ConsumerWidget {
  FormRiverpodPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultFormPage(
      title: 'Riverpod',
      child: Observer(
        builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                controller: emailController,
                onChanged: (value) {
                  ///store.onChangeEmail(value);
                },
              ),
              const SizedBox(height: 6),
              CustomTextField(
                controller: passwordController,
                onChanged: (value) {
                  //store.onChangePassword(value);
                },
              ),
              const SizedBox(height: 32),
              CustomButton(
                onPressed: () {
                  ref
                      .read(formRiverpodProvider)
                      .doLogin(
                        emailController.text,
                        passwordController.text,
                      )
                      .then((value) {
                    if (ref.read(formRiverpodProvider).value
                        is LoggedFormRiverpodState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Login completed!"),
                        ),
                      );
                    } else if (ref.read(formRiverpodProvider).value
                        is FailureFormRiverpodState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Login error!"),
                        ),
                      );
                    }
                  });
                },
                child: ref.watch(formRiverpodProvider).value
                        is LoadingFormRiverpodState
                    ? const CircularProgressIndicator()
                    : const Text("Login"),
              ),
            ],
          );
        },
      ),
    );
  }
}
