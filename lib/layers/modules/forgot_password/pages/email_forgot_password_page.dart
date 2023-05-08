import 'package:easyflow/layers/modules/forgot_password/forgot_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailForgotPasswordPage extends GetView<ForgotPasswordController> {
  const EmailForgotPasswordPage({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
    appBar: AppBar(title: Text('ForgotPasswordPage')),

    body: SafeArea(
      child: Text('ForgotPasswordController'))
    );
  }
}