import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

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
            SnackBar(content: Text("oi")),
          );
        }
      },
    );
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: email.set,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 6),
            TextField(
              onChanged: pass.set,
              decoration: InputDecoration(
                errorText: passError.watch(context),
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isValid.watch(context) ? validateForm : null,
                child: const Text("oi"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
