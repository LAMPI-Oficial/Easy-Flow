import 'package:easyflow/layers/domain/entities/forgot_password_send_code_entity.dart';
import 'package:easyflow/layers/domain/entities/forgot_password_send_email_entity.dart';
import 'package:easyflow/layers/domain/entities/forgot_password_send_password_entity.dart';
import 'package:easyflow/layers/domain/exceptions/api_exception.dart';
import 'package:easyflow/layers/domain/usecases/forgot_password_send_code_usecase.dart';
import 'package:easyflow/layers/domain/usecases/forgot_password_send_email_usecase.dart';
import 'package:easyflow/layers/domain/usecases/forgot_password_send_password_usecase.dart';
import 'package:easyflow/layers/presentation/ui/widgets/dialogs_widget.dart';
import 'package:flutter/material.dart';

class ForgotPasswordController {
  final ForgotPasswordSendEmailUseCase _forgotPasswordSendEmailUseCase;
  final ForgotPasswordSendCodeUseCase _forgotPasswordSendCodeUseCase;
  final ForgotPasswordSendPasswordUseCase _forgotPasswordSendPasswordUseCase;
  ForgotPasswordController(
    this._forgotPasswordSendEmailUseCase,
    this._forgotPasswordSendCodeUseCase,
    this._forgotPasswordSendPasswordUseCase,
  );

  final formKeyEmail = GlobalKey<FormState>();
  final formKeyCheckCode = GlobalKey<FormState>();
  final formKeyNewPassword = GlobalKey<FormState>();

  final emailTextEditingController = TextEditingController();
  int? id;

  final passwordTextEditingController = TextEditingController();
  final repeatPasswordTextController = TextEditingController();
  final codeTextEditingController = TextEditingController();

  String getRestrictedEmail(String email) {
    List<String> list = email.split("@");
    if (list[0].length > 5) {
      return "${list[0].substring(0, list[0].length - 5)}*****@${list[1]}";
    } else if (list[0].length == 5) {
      return "${list[0].substring(0, list[0].length - 4)}****@${list[1]}";
    } else if (list[0].length == 4) {
      return "${list[0].substring(0, list[0].length - 3)}***@${list[1]}";
    } else if (list[0].length == 3) {
      return "${list[0].substring(0, list[0].length - 2)}**@${list[1]}";
    } else if (list[0].length == 2) {
      return "${list[0].substring(0, list[0].length - 1)}*@${list[1]}";
    } else {
      return email;
    }
  }

  forgotPassword(BuildContext context, String page,
      final void Function(String) onPressedCallback) async {
    if (page == "email") {
      if (formKeyEmail.currentState!.validate()) {
        bool aux = await sendEmail(context);
        if (aux) {
          onPressedCallback(page);
        }
      }
    } else if (page == "code") {
      if (formKeyCheckCode.currentState!.validate()) {
        bool aux = await sendCode(context);
        if (aux) {
          onPressedCallback(page);
        }
      }
    } else if (page == "new_password") {
      if (formKeyNewPassword.currentState!.validate()) {
        onPressedCallback(page);
      }
    }
  }

  Future<bool> sendEmail(BuildContext context) async {
    Dialogs.loading(context);
    try {
      await _forgotPasswordSendEmailUseCase
          .call(ForgotPasswordSendEmailEntity(
              email: emailTextEditingController.text))
          .then((value) {
        id = value.id;
        return true;
      });
    } on ApiException catch (e) {
      Navigator.of(context).pop();
      Dialogs.error(context, title: e.title, message: e.message);
    }

    return false;
  }

  Future<bool> sendCode(BuildContext context) async {
    Dialogs.loading(context);
    try {
      await _forgotPasswordSendCodeUseCase
          .call(
        ForgotPasswordSendCodeEntity(
          id: id!,
          code: codeTextEditingController.text,
        ),
      )
          .then((value) {
        if (value) {
          return true;
        }
      });
    } on ApiException catch (e) {
      Navigator.of(context).pop();
      Dialogs.error(context, title: e.title, message: e.message);
    }

    return false;
  }

  Future<bool> sendPassword(BuildContext context) async {
    Dialogs.loading(context);
    try {
      await _forgotPasswordSendPasswordUseCase
          .call(
        ForgotPasswordSendPasswordEntity(
          id: id!,
          password: passwordTextEditingController.text,
          repeatPassword: repeatPasswordTextController.text,
        ),
      )
          .then((value) {
        if (value) {
          return true;
        }
      });
    } on ApiException catch (e) {
      Navigator.of(context).pop();
      Dialogs.error(context, title: e.title, message: e.message);
    }

    return false;
  }
}
