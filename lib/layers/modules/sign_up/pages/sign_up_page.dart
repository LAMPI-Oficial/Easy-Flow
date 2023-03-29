import 'package:easyflow/layers/modules/sign_up/pages/sign_up_personal_data.dart';
import 'package:easyflow/layers/modules/sign_up/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends GetView<SignUpController> {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SignUpPersonalData();
  }
}