import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testando_coisas/core/components/custom_button_component.dart';
import 'package:testando_coisas/core/components/custom_textfield_component.dart';
import 'package:testando_coisas/core/page/default_form_page.dart';
import 'package:testando_coisas/feat/getx/form/controller/form_getx_controller.dart';
import 'package:testando_coisas/feat/getx/form/state/form_getx_state.dart';

class FormGetxPage extends StatelessWidget {
  FormGetxPage({super.key});
  final controller = FormGetxController();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultFormPage(
      child: Column(
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
            onPressed: () async {
              await controller
                  .doLogin(emailController.text, passwordController.text)
                  .then((value) {
                if (controller.state.value is LoggedFormGetxState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Login completed"),
                    ),
                  );
                } else if (controller.state.value is FailureFormGetxState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Login failed"),
                    ),
                  );
                }
              });
            },
            child: Obx(() {
              return controller.state.value is LoadingFormGetxState
                  ? const CircularProgressIndicator()
                  : const Text("Login");
            }),
          ),
        ],
      ),
    );
  }
}
