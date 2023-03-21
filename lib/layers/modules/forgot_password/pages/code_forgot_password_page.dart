import 'package:easyflow/layers/modules/forgot_password/forgot_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/text_field_widget.dart';

class CodeForgotPasswordPage extends GetView<ForgotPasswordController> {
  const CodeForgotPasswordPage({super.key});


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
                      'Digite o código',
                      style: TextStyle(
                        fontFamily: "Segoe UI",
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: SizedBox(
                        width: 320,
                        child: Text(
                          'Um código de 4 dígitos foi enviado para seu e-mail verifique e digite abaixo',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Segoe UI",
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                    TextFieldWidget(
                      label: "Digite o código",
                      hintText: "Código",
                      controller: controller.emailTextController,
                      keyboardType: TextInputType.name,
                      prefixIcon: const Icon(Icons.onetwothree_rounded),
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: SizedBox(
                        width: 320,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Não recebeu?',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              ' Reenviar código',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: Colors.cyan
                              ),
                            ),
                          ],
                        ),
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
                          "Verificar",
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