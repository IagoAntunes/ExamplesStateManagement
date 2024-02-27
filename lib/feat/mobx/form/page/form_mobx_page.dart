import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:testando_coisas/core/components/custom_button_component.dart';
import 'package:testando_coisas/feat/mobx/form/store/form_mobx_store.store.dart';

import '../../../../core/components/custom_textfield_component.dart';
import '../../../../core/page/default_form_page.dart';

class FormMobxPage extends StatelessWidget {
  FormMobxPage({super.key});
  final store = FormMobxStore();

  @override
  Widget build(BuildContext context) {
    return DefaultFormPage(
      title: 'Mobx',
      child: Observer(
        builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                onChanged: (value) {
                  store.onChangeEmail(value);
                },
              ),
              const SizedBox(height: 6),
              CustomTextField(
                onChanged: (value) {
                  store.onChangePassword(value);
                },
              ),
              const SizedBox(height: 32),
              CustomButton(
                onPressed: store.isValid
                    ? () {
                        store.doLogin();
                      }
                    : null,
                child: store.isLoading
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
