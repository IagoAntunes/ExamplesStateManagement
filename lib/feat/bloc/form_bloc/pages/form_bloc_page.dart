import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testando_coisas/core/components/custom_button_component.dart';
import 'package:testando_coisas/core/components/custom_textfield_component.dart';
import 'package:testando_coisas/core/page/default_form_page.dart';
import 'package:testando_coisas/feat/bloc/form_bloc/bloc/form_bloc.dart';
import 'package:testando_coisas/feat/bloc/form_bloc/event/form_bloc_event.dart';

import '../state/form_bloc_state.dart';

class FormBlocPage extends StatelessWidget {
  FormBlocPage({super.key});
  final bloc = FormBloc();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return DefaultFormPage(
      child: BlocConsumer<FormBloc, IFormBlocState>(
        listener: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        },
        bloc: bloc,
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
                  bloc.add(
                    LoginFormBlocEvent(
                      email: emailController.text,
                      password: passwordController.text,
                    ),
                  );
                },
                child: const Text("Login"),
              )
            ],
          );
        },
      ),
    );
  }
}
