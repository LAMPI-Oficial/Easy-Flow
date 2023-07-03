import 'package:easyflow/core/utils/validators_util.dart';
import 'package:easyflow/layers/domain/exceptions/api_exception.dart';
import 'package:easyflow/layers/presentation/controller/user_controller.dart';
import 'package:easyflow/layers/presentation/provider/user_provider.dart';
import 'package:easyflow/layers/presentation/ui/widgets/dialogs_widget.dart';
import 'package:easyflow/layers/presentation/ui/widgets/text_field_secure_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final _loginTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = GetIt.I.get<UserController>();
    

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                key: _formKey,
                child: ListView(
                  padding: const EdgeInsets.all(32),
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text('E-mail'),
                      ),
                      controller: _loginTextController,
                      validator: (value) => Validators.isNotEmpty(value),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFieldSecureWidget(
                      label: 'Senha',
                      controller: _passwordTextController,
                      security: true,
                      validator: (value) => Validators.isNotEmpty(value),
                      textInputAction: TextInputAction.next,
                    ),
                    Container(
                      width: double.infinity,
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () => context.push('/forgot_password'),
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
                        onPressed: () async {if (_formKey.currentState!.validate()) {
                                Dialogs.loading(context);
                                try {
                                  await controller
                                      .login(
                                    _loginTextController.text,
                                    _passwordTextController.text,
                                  )
                                      .then((user) {
                                    GetIt.I<UserProvider>().auth(user);
                                 
                                      context.go(
                                         '/home');
                                 
                                  });
                                } on ApiException catch (e) {
                                  Navigator.of(context).pop();
                                  Dialogs.error(context,
                                      title: e.title, message: e.message);
                                }
                              }},
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
                            onPressed: () => context.push('/signup'),
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
