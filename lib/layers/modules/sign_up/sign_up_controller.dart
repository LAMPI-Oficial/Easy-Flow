import 'package:easyflow/layers/data/exceptions/custom_exceptions.dart';
import 'package:easyflow/layers/data/model/create_user_request_model.dart';
import 'package:easyflow/layers/data/repository/auth_repository.dart';
import 'package:easyflow/layers/data/service/user_service.dart';
import 'package:easyflow/layers/widgets/dialogs_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:result_dart/result_dart.dart';

class SignUpController extends GetxController {
  final AuthRepository _authRepository;
  SignUpController(this._authRepository);

  final formKey = GlobalKey<FormState>();

  final nameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final phoneTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final repeatPasswordTextController = TextEditingController();

  signUp(context) async {
    if (formKey.currentState!.validate()) {
      Dialogs.loading(context).show();
      try {
        final result = _authRepository.signUp(CreateUserRequestModel(
          name: nameTextController.text,
          email: emailTextController.text,
          phone: phoneTextController.text,
          password: passwordTextController.text,
          repeatPassword: repeatPasswordTextController.text,
        ));
        result.fold((success) {
          Dialogs.loading(context).dismiss();
          Get.put(UserService()).auth(success);
        }, (failure) {
          Dialogs.loading(context).dismiss();
          Dialogs.error(context, failure).show();
        });
      } on IncorrectSignUpException catch (e) {
        Dialogs.error(context, e).show();
      }
    }
  }
}
