import 'package:easyflow/layers/modules/forgot_password/forgot_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/validators_util.dart';
import '../../../widgets/text_field_widget.dart';

class NewPasswordForgotPasswordPage extends GetView<ForgotPasswordController> {
  const NewPasswordForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Form(
      key: controller.formKey3,
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: SizedBox(
            height: 600,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Digite sua nova senha',
                      style: TextStyle(
                        fontFamily: "Segoe UI",
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        '8 Caracteres;\nPossuir pelo menos um numero;\nTer ao menos uma letra maiúscula',
                        style: TextStyle(
                          fontFamily: "Segoe UI",
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      TextFieldWidget(
                        label: "Digite sua senha",
                        hintText: "Senha",
                        controller: controller.passwordTextController,
                        keyboardType: TextInputType.visiblePassword,
                        prefixIcon: const Icon(Icons.lock_outline_rounded),
                        textInputAction: TextInputAction.next,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) => Validators.combine(
                          [
                            () => Validators.isNotEmpty(value),
                            () => Validators.isPassword(value)
                          ],
                        ),
                      ),
                      TextFieldWidget(
                        label: "Confirme sua senha",
                        hintText: "Confirmar senha",
                        controller: controller.repeatPasswordTextController,
                        keyboardType: TextInputType.visiblePassword,
                        prefixIcon: const Icon(Icons.lock_outline_rounded),
                        textInputAction: TextInputAction.next,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) => Validators.combine(
                          [
                            () => Validators.isNotEmpty(value),
                            () => Validators.isEqualPassword(
                                controller.passwordTextController.text, value)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.resetPassword();
                    },
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.blue),
                    ),
                    child: const Text(
                      "Alterar senha",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    )));
  }
}
