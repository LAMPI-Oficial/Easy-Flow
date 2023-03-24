import 'package:easyflow/core/routes/app_pages.dart';
import 'package:easyflow/core/utils/validators_util.dart';
import 'package:easyflow/layers/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Bem - vindo",
                  style: TextStyle(
                      fontFamily: 'Segoe_UI',
                      fontSize: 32,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  'Entre com sua conta',
                  style: TextStyle(
                      fontFamily: 'Segoe_UI',
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ],
            )),
            Expanded(
              flex: 2,
              child: Form(
                key: controller.formKey,
                child: ListView(
                  padding: const EdgeInsets.all(32),
                  children: [
                    TextFieldWidget(
                      label: 'E-mail',
                      hintText: 'e-mail',
                      prefixIcon: const Icon(Icons.email_outlined),
                      controller: controller.loginTextController,
                      validator: (value) => Validators.isNotEmpty(value),
                      textInputAction: TextInputAction.next,
                    ),
                    TextFieldWidget(
                      label: 'Senha',
                      hintText: "senha",
                      prefixIcon: const Icon(Icons.lock_outlined),
                      controller: controller.passwordTextController,
                      security: true,
                      validator: (value) => Validators.isNotEmpty(value),
                      textInputAction: TextInputAction.next,
                    ),
                    Container(
                      width: double.infinity,
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () => Navigator.of(context)
                            .pushNamed(Routes.FORGOT_PASSWORD_EMAIL),
                        child: const Text(
                          "Esqueceu a senha?",
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(vertical: 30),
                      child: ElevatedButton(
                        onPressed: () => controller.login(context),
                        child: const Text('Entrar'),
                      ),
                    ),
                    Row(
                      children: const [
                        Expanded(
                          child: Divider(),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'ou',
                            style: TextStyle(color: Color(0xFF8B8B8B)),
                          ),
                        ),
                        Expanded(
                          child: Divider(),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Não tem uma conta? '),
                        TextButton(
                            onPressed: () =>
                                Navigator.of(context).pushNamed(Routes.SIGN_UP),
                            child: const Text('Criar conta'))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
