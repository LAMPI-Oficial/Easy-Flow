import 'package:easyflow/layers/presentation/controller/forgot_password_controller.dart';
import 'package:easyflow/layers/presentation/ui/widgets/text_field_secure_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../../core/utils/validators_util.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  String forgotPasswordPage = "email";

  final controller = GetIt.I.get<ForgotPasswordController>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (forgotPasswordPage == "email") {
          return true;
        } else {
          beforePage(forgotPasswordPage);
          return false;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Form(
            key: getkeyController(forgotPasswordPage),
            child: Column(
              children: [
                Expanded(child: getForm(context, forgotPasswordPage)),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(16),
                  child: ElevatedButton(
                    onPressed: () {
                      controller.forgotPassword(
                          context, forgotPasswordPage, nextPage);
                    },
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.blue),
                    ),
                    child: Text(
                      getTextButton(forgotPasswordPage),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void nextPage(String page) {
    if (page == "email") {
      setState(() {
        forgotPasswordPage = "code";
      });
    } else if (page == "code") {
      setState(() {
        forgotPasswordPage = "new_password";
      });
    } else if (page == "new_password") {
      setState(() {
        forgotPasswordPage = "success";
      });
    }
  }

  void beforePage(String page) {
    if (page == "success") {
      setState(() {
        forgotPasswordPage = "email";
      });
    } else if (page == "new_password") {
      setState(() {
        forgotPasswordPage = "code";
      });
    } else if (page == "code") {
      setState(() {
        forgotPasswordPage = "email";
      });
    }
  }

  Key getkeyController(String page) {
    if (page == "email") {
      return controller.formKeyEmail;
    } else if (page == "code") {
      return controller.formKeyCheckCode;
    } else {
      return controller.formKeyNewPassword;
    }
  }

  Widget getForm(BuildContext mycontext, String page) {
    if (page == "email") {
      return ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Esqueceu sua senha?',
            style: TextStyle(
              fontFamily: "Segoe UI",
              fontWeight: FontWeight.w700,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          TextFormField(
            autofocus: true,
            decoration: const InputDecoration(
              label: Text("Digite seu email"),
            ),
            controller: controller.emailTextEditingController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) => Validators.combine(
              [
                () => Validators.isNotEmpty(value),
                () => Validators.isEmail(value)
              ],
            ),
          ),
        ],
      );
    } else if (page == "code") {
      return Column(
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
                  'Um código de 4 dígitos foi enviado para seu e-mail'
                  ' ${controller.getRestrictedEmail(controller.emailTextEditingController.text)}'
                  ' verifique e digite abaixo',
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
                    appContext: mycontext,
                    autoDisposeControllers: false,
                    controller: controller.codeTextEditingController,
                    cursorColor: Colors.blueAccent,
                    keyboardType: TextInputType.number,
                    autoFocus: true,
                    animationType: AnimationType.none,
                    pinTheme: PinTheme(
                      activeColor: Theme.of(mycontext).colorScheme.primary,
                      selectedColor: Theme.of(mycontext).colorScheme.primary,
                      errorBorderColor: Theme.of(mycontext).colorScheme.error,
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
        ],
      );
    } else if (page == "new_password") {
      return ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Digite sua nova senha',
            style: TextStyle(
              fontFamily: "Segoe UI",
              fontWeight: FontWeight.w700,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            '8 Caracteres;\nPossuir pelo menos um numero;\nTer ao menos uma letra maiúscula',
            style: TextStyle(
              fontFamily: "Segoe UI",
              fontWeight: FontWeight.w400,
              fontSize: 13,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          TextFieldSecureWidget(
            autofocus: true,
            label: "Nova senha",
            controller: controller.passwordTextEditingController,
            security: true,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.next,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) => Validators.combine(
              [
                () => Validators.isNotEmpty(value),
                () => Validators.isPassword(value)
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          TextFieldSecureWidget(
            label: "Senha novamente",
            controller: controller.repeatPasswordTextController,
            keyboardType: TextInputType.visiblePassword,
            security: true,
            textInputAction: TextInputAction.next,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) => Validators.combine(
              [
                () => Validators.isNotEmpty(value),
                () => Validators.isEqualPassword(
                    controller.passwordTextEditingController.text, value)
              ],
            ),
          ),
        ],
      );
    } else {
      return const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.fact_check_outlined,
              color: Colors.green,
              size: 100,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Senha alterada com sucesso",
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      );
    }
  }

  String getTextButton(String page) {
    if (page == "email") {
      return "Enviar código";
    } else if (page == "code") {
      return "Verificar";
    } else if (page == "new_password") {
      return "Alterar senha";
    } else {
      return "Faça login";
    }
  }
}
