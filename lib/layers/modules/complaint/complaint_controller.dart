import 'package:easyflow/layers/data/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ComplaintController extends GetxController {
  final AuthRepository _authRepository;
  ComplaintController(this._authRepository);

  final formKey = GlobalKey<FormState>();

  final nameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final descriptionTextController = TextEditingController();
  var archiveTextController;

  complaint(){
    if (formKey.currentState!.validate()) {

    }
  }
}