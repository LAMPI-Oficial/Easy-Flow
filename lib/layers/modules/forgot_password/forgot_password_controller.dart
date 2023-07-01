import 'package:easyflow/layers/data/repository/auth_repository.dart';
import 'package:flutter/material.dart';

class ForgotPasswordController  {
  final AuthRepository repository;
  ForgotPasswordController(this.repository);
  final formKeyEmail = GlobalKey<FormState>();
  final formKeyCheckCode = GlobalKey<FormState>();
  final formKeyNewPassword = GlobalKey<FormState>();

  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  final repeatPasswordTextController = TextEditingController();
  final codeTextEditingController = TextEditingController();

  sendCode(context) {
    if (formKeyEmail.currentState!.validate()) {
      context.push('/forgot_password/code');
    }
  }

  checkCode(context) {
    if (formKeyCheckCode.currentState!.validate()) {
      context.push('/forgot_password/password/new');
    }
  }

  forgotPassword(context) {
    if (formKeyNewPassword.currentState!.validate()) {
      context.push('/forgot_password/sucess');
    }
  }
}
