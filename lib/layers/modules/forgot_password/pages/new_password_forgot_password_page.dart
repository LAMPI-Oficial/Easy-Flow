import 'package:easyflow/layers/modules/forgot_password/forgot_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewPasswordForgotPasswordPage extends GetView<ForgotPasswordController> {
  const NewPasswordForgotPasswordPage({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
    appBar: AppBar(title: Text('NewPasswordForgotPasswordPage')),

    body: SafeArea(
      child: Text('NewPasswordForgotPasswordController'))
    );
  }
}