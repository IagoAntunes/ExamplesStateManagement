import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:testando_coisas/core/components/custom_button_component.dart';
import 'package:testando_coisas/core/components/custom_textfield_component.dart';
import 'package:testando_coisas/core/page/default_form_page.dart';

class FormSignals extends StatelessWidget {
  FormSignals({super.key});

  final email = signal('');
  final pass = signal('');

  final passError = signal<String?>(null);

  late final isValid = computed(() => email().isNotEmpty && pass().isNotEmpty);

  validateForm() {
    if (pass().length > 6) {
      passError.value = null;
    } else {
      passError.value = "Erro. Minimo de 6 caracteres";
    }
  }

  @override
  Widget build(BuildContext context) {
    isValid.listen(
      context,
      () {
        if (isValid.value == true) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("oi")),
          );
        }
      },
    );
    return DefaultFormPage(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextField(
            onChanged: email.set,
          ),
          const SizedBox(height: 6),
          CustomTextField(
            onChanged: pass.set,
          ),
          const SizedBox(height: 32),
          CustomButton(
            onPressed: isValid.watch(context) ? validateForm : null,
            child: const Text("Login"),
          )
        ],
      ),
    );
  }
}
