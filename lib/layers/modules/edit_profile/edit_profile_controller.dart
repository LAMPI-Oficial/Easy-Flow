import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final nameTextController =
      TextEditingController(text: "Carla pereira honorato");
  final emailTextController =
      TextEditingController(text: "carlapereira21@gmail.com");
  final courseTextController =
      TextEditingController(text: "Analise desenvolvimento de sistemas");
  final areaTextController = TextEditingController(text: "UX-UI");

  //  saveEditions(context) async {
  //   if (formKey.currentState!.validate()) {
  //     Dialogs.loading(context).show();
  //     try {
  //       final result = _authRepository.login(AuthRequestModel(
  //           login: loginTextController.text,
  //           password: passwordTextController.text));
  //       result.fold((success) {
  //         Dialogs.loading(context).dismiss();
  //         Get.put(UserService()).auth(success);
  //       }, (failure) {
  //         Dialogs.loading(context).dismiss();
  //         Dialogs.error(context, failure).show();
  //       });
  //     } on IncorrectLoginOrPasswordException catch (e) {
  //       Dialogs.error(context, e).show();
  //     }
  //   }
  // }
}
