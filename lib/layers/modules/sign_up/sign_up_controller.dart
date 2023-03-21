import 'package:easyflow/core/routes/app_pages.dart';
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

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();

  final nameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final phoneTextController = TextEditingController();
  final courseTextController = TextEditingController();
  final areaOfStudyTextController = TextEditingController();
  final List<String> courseList = ["Selecionar curso", "Redes", "ADS", "Eventos"];
  final dropdownCourseValue = "Selecionar curso".obs;
  final dropdownCourseValuePattern = "Selecionar curso";
  final List<String> areaOfStudyList = ["Selecionar área de estudo","Programação WEB", "UX/UI", "Jogos"];
  final dropdownAreaOfStudyValue = "Selecionar área de estudo".obs;
  final dropdownAreaOfStudyValuePattern = "Selecionar área de estudo";

  final cepTextController = TextEditingController();
  final streetTextController = TextEditingController();
  final neighborhoodTextController = TextEditingController();
  final houseNumberTextController = TextEditingController();
  final municipalityTextController = TextEditingController();
  final stateTextController = TextEditingController();
  final complementTextController = TextEditingController();

  final passwordTextController = TextEditingController();
  final repeatPasswordTextController = TextEditingController();

  signUp1(context) async {
    if (formKey1.currentState!.validate()) {
      if("$dropdownCourseValue" != dropdownCourseValuePattern && "$dropdownAreaOfStudyValue" != dropdownAreaOfStudyValuePattern){
        Get.toNamed(Routes.SIGN_UP_RESIDENTIAL);
      }
    }
  }
  signUp2(context) async {
    if (formKey2.currentState!.validate()) {
      Get.toNamed(Routes.SIGN_UP_PASSWORD);
    }
  }

  signUp3(context) async {
    if (formKey3.currentState!.validate()) {
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
