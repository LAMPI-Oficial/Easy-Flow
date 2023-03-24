import 'package:easyflow/layers/data/exceptions/custom_exceptions.dart';
import 'package:easyflow/layers/data/model/auth_request_model.dart';
import 'package:easyflow/layers/data/service/user_service.dart';
import 'package:easyflow/layers/data/repository/auth_repository.dart';
import 'package:easyflow/layers/widgets/dialogs_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:result_dart/result_dart.dart';

class LoginController extends GetxController {
  final AuthRepository _authRepository;
  LoginController(this._authRepository);

  final formKey = GlobalKey<FormState>();

  final loginTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  login(context) async {
    if (formKey.currentState!.validate()) {
      Dialogs.loading(context).show();
      try {
        final result = _authRepository.login(AuthRequestModel(
            login: loginTextController.text,
            password: passwordTextController.text));
        result.fold((success) {
          Dialogs.loading(context).dismiss();
          Get.put(UserService()).auth(success);
        }, (failure) {
          Dialogs.loading(context).dismiss();
          Dialogs.error(context, failure).show();
        });
      } on IncorrectLoginOrPasswordException catch (e) {
        Dialogs.error(context, e).show();
      }
    }
  }
}
