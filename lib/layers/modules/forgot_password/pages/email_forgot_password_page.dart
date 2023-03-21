import 'package:easyflow/layers/modules/forgot_password/forgot_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/text_field_widget.dart';

class EmailForgotPasswordPage extends GetView<ForgotPasswordController> {
  const EmailForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Form(
      key: controller.formKey,
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Esqueceu sua senha?',
              style: TextStyle(
                fontFamily: "Segoe UI",
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: TextFieldWidget(
                label: "Digite seu email",
                hintText: "Email",
                controller: controller.emailTextController,
                keyboardType: TextInputType.name,
                prefixIcon: const Icon(Icons.email_outlined),
                textInputAction: TextInputAction.next,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
            ),
            const SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: null,
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blue),
                ),
                child: Text(
                  "Enviar código",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    )));
  }
}
