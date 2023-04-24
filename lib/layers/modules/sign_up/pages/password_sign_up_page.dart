import 'package:easyflow/layers/modules/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../../core/utils/validators_util.dart';
import '../../../widgets/text_field_secure_widget.dart';
import '../sign_up_controller.dart';

class PasswordSignUpPage extends GetView<SignUpController> {
  const PasswordSignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(value: 3, subtitle: 'Senha'),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: controller.formKeyPassword,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    TextFieldSecureWidget(
                      label: "Senha",
                      controller: controller.passwordTextController,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      security: true,
                      validator: (value) => Validators.combine(
                        [
                          () => Validators.isNotEmpty(value),
                          () => Validators.isPassword(value)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                width: double.infinity,
                color: Colors.white,
                child: ElevatedButton(
                  onPressed: () => controller.password(context),
                  child: const Text("Continuar"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
