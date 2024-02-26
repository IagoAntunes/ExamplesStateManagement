import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:testando_coisas/feat/mobx/form/store/form_mobx_store.store.dart';

class FormMobxPage extends StatelessWidget {
  FormMobxPage({super.key});
  final store = FormMobxStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Form Mobx Page")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        child: Observer(
          builder: (context) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  onChanged: (value) {
                    store.onChangeEmail(value);
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 6),
                TextField(
                  onChanged: (value) {
                    store.onChangePassword(value);
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: store.isValid
                        ? () {
                            store.doLogin();
                          }
                        : null,
                    child: store.isLoading
                        ? const CircularProgressIndicator()
                        : const Text("Login"),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
