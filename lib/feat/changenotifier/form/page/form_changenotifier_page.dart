import 'package:flutter/material.dart';
import 'package:testando_coisas/core/page/default_form_page.dart';
import 'package:testando_coisas/feat/changenotifier/form/controller/form_changenotifier_controller.dart';
import 'package:testando_coisas/feat/changenotifier/form/state/form_changenotifier_state.dart';

import '../../../../core/components/custom_button_component.dart';
import '../../../../core/components/custom_textfield_component.dart';

class FormChangeNotifierPage extends StatelessWidget {
  FormChangeNotifierPage({super.key});
  final controller = FormChangeNotifierController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return DefaultFormPage(
      title: 'ChangeNotifier',
      child: ListenableBuilder(
        listenable: controller,
        builder: (context, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                controller: emailController,
                onChanged: (value) {
                  //
                },
              ),
              const SizedBox(height: 6),
              CustomTextField(
                controller: passwordController,
                onChanged: (value) {},
              ),
              const SizedBox(height: 32),
              CustomButton(
                onPressed: () {
                  controller.doLogin(
                      emailController.text, passwordController.text);
                },
                child: controller.state is LoadingFormChangeNotifierState
                    ? const CircularProgressIndicator()
                    : const Text("Login"),
              )
            ],
          );
        },
      ),
    );
  }
}
