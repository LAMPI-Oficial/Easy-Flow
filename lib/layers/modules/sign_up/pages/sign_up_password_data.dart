import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../../core/utils/validators_util.dart';
import '../../../widgets/text_field_widget.dart';
import '../sign_up_controller.dart';

class SignUpPasswordData extends GetView<SignUpController> {
  SignUpPasswordData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: controller.formKey3,
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              height: 650,
              child: Column(
                children: [
                  Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Cadastro",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Senha",
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: SizedBox(
                            width: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              child: LinearProgressIndicator(
                                value: 1,
                                minHeight: 8,
                                backgroundColor: Color.fromRGBO(199, 211, 235, 1),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: SizedBox(
                            width: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              child: LinearProgressIndicator(
                                value: 1,
                                minHeight: 8,
                                backgroundColor: Color.fromRGBO(199, 211, 235, 1),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: SizedBox(
                            width: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              child: LinearProgressIndicator(
                                value: 1,
                                minHeight: 8,
                                backgroundColor: Color.fromRGBO(199, 211, 235, 1),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 400,
                    padding: EdgeInsets.all(12),
                    margin: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          TextFieldWidget(
                            label: "Digite sua senha",
                            hintText: "Senha",
                            controller: controller.passwordTextController,
                            keyboardType: TextInputType.name,
                            prefixIcon: Icon(Icons.add_circle),
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
                            label: "Digite a confirmação de senha",
                            hintText: "Confirmar",
                            controller: controller.repeatPasswordTextController,
                            keyboardType: TextInputType.name,
                            prefixIcon: Icon(Icons.add_circle),
                            textInputAction: TextInputAction.next,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value) => Validators.combine(
                              [
                                    () => Validators.isNotEmpty(value),
                                    () => Validators.isEqualPassword(controller.passwordTextController.text, "$value")
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    width: double.infinity,
                    color: Colors.white,
                    child: Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => Navigator.of(context)..pop()..pop(),
                            style: OutlinedButton.styleFrom(
                                side: BorderSide(
                                    color: Theme.of(context).colorScheme.error),
                                foregroundColor:
                                Theme.of(context).colorScheme.error),
                            child: Text("Cancelar"),
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => controller.signUp3(context),
                            child: Text("Confirmar cadastro"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
