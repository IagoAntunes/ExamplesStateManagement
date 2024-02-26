import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testando_coisas/core/components/custom_button_component.dart';
import 'package:testando_coisas/core/components/custom_textfield_component.dart';
import 'package:testando_coisas/core/page/default_form_page.dart';
import 'package:testando_coisas/feat/cubit/form/bloc/form_cubit.dart';
import 'package:testando_coisas/feat/cubit/form/state/form_cubit_state.dart';

class FormCubitPage extends StatelessWidget {
  FormCubitPage({super.key});
  final cubit = FormCubit();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return DefaultFormPage(
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
                  cubit.login(emailController.text, passwordController.text);
                },
                child: state is LoadingFormCubitState
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
