import 'package:easyflow/core/routes/app_pages.dart';
import 'package:easyflow/layers/data/exceptions/api_exception.dart';
import 'package:easyflow/layers/data/model/auth_request_model.dart';
import 'package:easyflow/layers/data/service/user_service.dart';
import 'package:easyflow/layers/data/repository/auth_repository.dart';
import 'package:easyflow/layers/widgets/dialogs_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final AuthRepository _authRepository;
  LoginController(this._authRepository);

  final formKey = GlobalKey<FormState>();

  final loginTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  login(context) async {
    if (formKey.currentState!.validate()) {
      Dialogs.loading(context);
      try {
       await _authRepository
            .login(AuthRequestModel(
                login: loginTextController.text,
                password: passwordTextController.text))
            .then((user) {
          Get.put(UserService()).auth(user);
          Navigator.of(context).pushNamed(Routes.HOME);
        });
      } on ApiException catch (e) {
        Navigator.of(context).pop();
        Dialogs.error(context, title: e.title, message: e.message);
      }
    }
  }
}
