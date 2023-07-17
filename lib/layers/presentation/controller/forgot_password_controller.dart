import 'package:flutter/material.dart';

class ForgotPasswordController {
  final formKeyEmail = GlobalKey<FormState>();
  final formKeyCheckCode = GlobalKey<FormState>();
  final formKeyNewPassword = GlobalKey<FormState>();

  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  final repeatPasswordTextController = TextEditingController();
  final codeTextEditingController = TextEditingController();

  String getRestrictedEmail(String email) {
    List<String> list = email.split("@");
    if (list[0].length > 5) {
      return "${list[0].substring(0, list[0].length - 5)}*****@${list[1]}";
    } else if (list[0].length == 5) {
      return "${list[0].substring(0, list[0].length - 4)}****@${list[1]}";
    } else if (list[0].length == 4) {
      return "${list[0].substring(0, list[0].length - 3)}***@${list[1]}";
    } else if (list[0].length == 3) {
      return "${list[0].substring(0, list[0].length - 2)}**@${list[1]}";
    } else if (list[0].length == 2) {
      return "${list[0].substring(0, list[0].length - 1)}*@${list[1]}";
    } else {
      return email;
    }
  }

  forgotPassword(BuildContext context, String page,
      final void Function(String) onPressedCallback) async {
    if (page == "email") {
      if (formKeyEmail.currentState!.validate()) {
        onPressedCallback(page);
      }
    } else if (page == "code") {
      if (formKeyCheckCode.currentState!.validate()) {
        onPressedCallback(page);
      }
    } else if (page == "new_password") {
      if (formKeyNewPassword.currentState!.validate()) {
        onPressedCallback(page);
      }
    }
  }
}
