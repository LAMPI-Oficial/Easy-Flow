import 'package:easyflow/core/utils/validators_util.dart';
import 'package:easyflow/layers/modules/sign_up/sign_up_controller.dart';
import 'package:easyflow/layers/widgets/photo_picker_widget.dart';
import 'package:easyflow/layers/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends GetView<SignUpController> {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Crie sua conta",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Utilize dados reais",
                    textAlign: TextAlign.center,
                  ),
                ],
              )),
              Expanded(
                flex: 3,
                child: Stack(
                  fit: StackFit.expand,
                  alignment: Alignment.center,
                  children: [
                    Positioned(top: 0, child: PhotoPickerWidget()),
                    Positioned(
                      top: 100,
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50))),
                        child: ListView(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          children: [
                            TextFieldWidget(
                              label: "Digite seu nome completo",
                              hintText: "nome completo",
                              controller: controller.nameTextController,
                              keyboardType: TextInputType.name,
                              prefixIcon: const Icon(Icons.badge_outlined),
                              textInputAction: TextInputAction.next,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) => Validators.combine(
                                [
                                  () => Validators.isNotEmpty(value),
                                  () => Validators.IsName(value)
                                ],
                              ),
                            ),
                            TextFieldWidget(
                              label: "Digite seu e-mail",
                              hintText: "e-mail",
                              controller: controller.emailTextController,
                              prefixIcon: const Icon(Icons.email_outlined),
                              keyboardType: TextInputType.emailAddress,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              textInputAction: TextInputAction.next,
                              validator: (value) => Validators.combine(
                                [
                                  () => Validators.isNotEmpty(value),
                                  () => Validators.isEmail(value)
                                ],
                              ),
                            ),
                            TextFieldWidget(
                              label: "Digite seu curso",
                              hintText: "curso",
                              controller: controller.emailTextController,
                              prefixIcon:
                                  const Icon(Icons.chrome_reader_mode_outlined),
                              keyboardType: TextInputType.emailAddress,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              textInputAction: TextInputAction.next,
                              validator: (value) =>
                                  Validators.isNotEmpty(value),
                            ),
                            TextFieldWidget(
                              label: "Senha",
                              hintText: "senha",
                              security: true,
                              controller: controller.passwordTextController,
                              keyboardType: TextInputType.visiblePassword,
                              prefixIcon: const Icon(Icons.lock_outlined),
                              textInputAction: TextInputAction.next,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) => Validators.combine(
                                [
                                  () => Validators.isNotEmpty(value),
                                  () => Validators.isPassword(value),
                                ],
                              ),
                            ),
                            TextFieldWidget(
                              label: "Confirmar senha",
                              hintText: "senha novamente",
                              controller:
                                  controller.repeatPasswordTextController,
                              security: true,
                              prefixIcon: const Icon(Icons.lock_outlined),
                              keyboardType: TextInputType.visiblePassword,
                              textInputAction: TextInputAction.next,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) => Validators.combine(
                                [
                                  () => Validators.isNotEmpty(value),
                                  () => Validators.isEqualPassword(value,
                                      controller.passwordTextController.text)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        style: OutlinedButton.styleFrom(
                            side: BorderSide(
                                color: Theme.of(context).colorScheme.error),
                            foregroundColor:
                                Theme.of(context).colorScheme.error),
                        child: const Text("Cancelar"),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => controller.signUp(context),
                        child: const Text("Confirmar cadastro"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
