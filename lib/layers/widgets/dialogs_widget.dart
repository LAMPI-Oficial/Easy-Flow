import 'package:easyflow/layers/data/exceptions/custom_exceptions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish_dialog/stylish_dialog.dart';

class Dialogs {
  static StylishDialog? _dialogLoading;
  static StylishDialog? _incorrectLoginOrPassword;
  static StylishDialog? _genericError;

  static StylishDialog loading(context) {
    _dialogLoading ??= StylishDialog(
      context: context,
      alertType: StylishDialogType.NORMAL,
      dismissOnTouchOutside: false,
      style: Style1(
          backgroundColor: Colors.transparent,
          dialogBgColor: Colors.transparent),
      addView: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 40,
            height: 40,
            child: GetPlatform.isIOS
                ? CupertinoActivityIndicator(
                    radius: 20, color: Theme.of(context).colorScheme.primary)
                : CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.primary),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Aguarde...',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.white),
          ),
        ],
      ),
    );

    return _dialogLoading!;
  }

  static StylishDialog _incorrectLoginOrPassowrd(context) {
    _incorrectLoginOrPassword ??= StylishDialog(
      context: context,
      alertType: StylishDialogType.ERROR,
      title: const Text(
        "Login ou Senha Inválido",
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
        ),
      ),
      content: const Text(
        "Vefique suas Credenciais.",
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 12,
        ),
      ),
    );
    return _incorrectLoginOrPassword!;
  }

  static StylishDialog _genericErro(context) {
    _genericError ??= StylishDialog(
      context: context,
      alertType: StylishDialogType.ERROR,
      title: const Text(
        "Erro ao Realizar Operação",
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
        ),
      ),
      content: const Text(
        "Por favor, tente novamente.",
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 12,
        ),
      ),
    );
    return _genericError!;
  }

  static StylishDialog error(context, Exception e) {
    final Map errosMap = {
      IncorrectLoginOrPasswordException: _incorrectLoginOrPassowrd(context)
    };
    return errosMap.containsKey(e) ? errosMap[e] : _genericErro(context);
  }
}
