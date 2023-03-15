import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessSignUpPage extends StatelessWidget {
  const SuccessSignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('SignUpSuccessPage')),
        body: SafeArea(child: Text('SignUpSuccessController')));
  }
}
