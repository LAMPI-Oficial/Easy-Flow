import 'package:flutter/material.dart';


class SuccessForgotPasswordPage extends StatelessWidget {
  const SuccessForgotPasswordPage({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
    appBar: AppBar(title: Text('SuccessForgotPasswordPage')),

    body: SafeArea(
      child: Text('SuccessForgotPasswordController'))
    );
  }
}