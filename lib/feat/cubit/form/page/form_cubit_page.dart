import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testando_coisas/feat/cubit/form/bloc/form_cubit.dart';
import 'package:testando_coisas/feat/cubit/form/state/form_cubit_state.dart';

class FormCubitPage extends StatelessWidget {
  FormCubitPage({super.key});
  final cubit = FormCubit();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Form Bloc Page")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        child: BlocConsumer<FormCubit, IFormCubitState>(
          listenWhen: (previous, current) => current is IFormCubitListeners,
          listener: (context, state) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text((state as IFormCubitListeners).message),
              ),
            );
          },
          bloc: cubit,
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: emailController,
                  onChanged: (value) {
                    //
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 6),
                TextField(
                  controller: passwordController,
                  onChanged: (value) {},
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      cubit.login(
                          emailController.text, passwordController.text);
                    },
                    child: state is LoadingFormCubitState
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
