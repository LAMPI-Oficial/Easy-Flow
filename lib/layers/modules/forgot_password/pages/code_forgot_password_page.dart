import 'package:easyflow/layers/modules/forgot_password/forgot_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CodeForgotPasswordPage extends GetView<ForgotPasswordController> {
  const CodeForgotPasswordPage({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
    appBar: AppBar(title: Text('CodeForgotPasswordPage')),

    body: SafeArea(
      child: Text('CodeForgotPasswordController'))
    );
  }
}