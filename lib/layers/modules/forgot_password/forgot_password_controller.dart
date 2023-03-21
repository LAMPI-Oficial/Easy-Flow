import 'package:easyflow/layers/data/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {

final AuthRepository _repository;
ForgotPasswordController(this._repository);

final formKey = GlobalKey<FormState>();

final emailTextController = TextEditingController();


}