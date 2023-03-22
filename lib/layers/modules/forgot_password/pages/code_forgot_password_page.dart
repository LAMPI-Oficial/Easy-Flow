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
        body: SafeArea(
            child: Form(
      key: controller.formKey2,
      child: Container(
        alignment: AlignmentDirectional.center,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SizedBox(
            width: 300,
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
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: PinCodeTextField(
                    controller: controller.codeTextController,
                    appContext: context,
                    cursorColor: Colors.blueAccent,
                    keyboardType: TextInputType.number,
                    pinTheme: PinTheme(
                        activeColor: Colors.blue,
                        selectedColor: Colors.blue,
                        inactiveColor: Colors.grey,
                        shape: PinCodeFieldShape.box,
                        fieldHeight: 50,
                        fieldWidth: 50,
                        borderRadius: BorderRadius.circular(10)),
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
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SizedBox(
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
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.checkCode();
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
          ),
        ),
      ),
    )));
  }
}
