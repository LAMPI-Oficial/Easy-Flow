import 'package:easyflow/core/routes/app_pages.dart';
import 'package:easyflow/layers/data/exceptions/api_exception.dart';
import 'package:easyflow/layers/data/repository/forgot_password_repository.dart';
import 'package:easyflow/layers/widgets/dialogs_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  final ForgotPasswordRepository _forgotPassowordRepository;

  ForgotPasswordController(this._forgotPassowordRepository);

  final formKeyEmail = GlobalKey<FormState>();

  final emailTextController = TextEditingController();
  final repeatPasswordTextController = TextEditingController();

  sendCode(context) async{
    if (formKeyEmail.currentState!.validate()) {
      Dialogs.loading(context);
      try{
        await _forgotPassowordRepository.forgot(emailTextController.text)
            .then((value){
              if(value == 'ok'){
                Navigator.of(context).pushNamed(Routes.FORGOT_PASSWORD_SUCCESS);
              }
        });

      } on ApiException catch (e) {
        Navigator.of(context).pop();
        Dialogs.error(context, title: e.title, message: e.message);
      }
    }
  }

}
