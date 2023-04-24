import 'package:easyflow/layers/modules/forgot_password/forgot_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/utils/validators_util.dart';

class CodeForgotPasswordPage extends GetView<ForgotPasswordController> {
  const CodeForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Form(
          key: controller.formKeyCheckCode,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    const Text(
                      'Digite o código',
                      style: TextStyle(
                        fontFamily: "Segoe UI",
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Um código de 4 dígitos foi enviado para seu e-mail ${controller.emailTextController.text.substring(0, 4)}∗∗∗∗∗${controller.emailTextController.text.substring(9)} verifique e digite abaixo',
                      style: const TextStyle(
                        fontFamily: "Segoe UI",
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: PinCodeTextField(
                        appContext: context,
                        controller: controller.codeTextController,
                        cursorColor: Colors.blueAccent,
                        keyboardType: TextInputType.number,
                        autoFocus: true,
                        animationType: AnimationType.none,
                        pinTheme: PinTheme(
                          activeColor: Theme.of(context).colorScheme.primary,
                          selectedColor: Theme.of(context).colorScheme.primary,
                          errorBorderColor: Theme.of(context).colorScheme.error,
                          inactiveColor: Colors.grey,
                          shape: PinCodeFieldShape.box,
                          fieldHeight: 50,
                          fieldWidth: 50,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        length: 4,
                        validator: (value) => Validators.combine(
                          [
                            () => Validators.isNotEmpty(value),
                            () => Validators.isCodeForgotPassword(value)
                          ],
                        ),
                        onChanged: (value) {},
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 320,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Não recebeu?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      ),
                    ),
                    GestureDetector(
                      child: const Text(
                        ' Reenviar código',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: Colors.cyan),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.all(16),
                child: ElevatedButton(
                  onPressed: () {
                    controller.checkCode(context);
                  },
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.blue),
                  ),
                  child: const Text(
                    "Verificar",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        )));
  }
}
