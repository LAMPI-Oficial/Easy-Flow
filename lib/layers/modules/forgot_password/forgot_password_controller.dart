import 'package:easyflow/core/routes/app_pages.dart';
import 'package:easyflow/layers/data/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  final AuthRepository _repository;
  ForgotPasswordController(this._repository);

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();

  final emailTextController = TextEditingController();
  final codeTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final repeatPasswordTextController = TextEditingController();

  sendCode() {
    if (formKey1.currentState!.validate()) {
      Get.toNamed(Routes.FORGOT_PASSWORD_CODE);
    }
  }

  checkCode() {
    if (formKey2.currentState!.validate()) {
      Get.toNamed(Routes.FORGOT_PASSWORD_NEW_PASSWORD);
    }
  }

  resetPassword() {
    if (formKey3.currentState!.validate()) {
      Get.toNamed(Routes.FORGOT_PASSWORD_SUCCESS);
    }
  }
}
