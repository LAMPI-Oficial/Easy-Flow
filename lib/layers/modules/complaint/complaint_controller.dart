import 'package:easyflow/layers/data/exceptions/api_exception.dart';
import 'package:easyflow/layers/data/repository/auth_repository.dart';
import 'package:easyflow/layers/data/repository/complaint_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ComplaintController extends GetxController {
  final AuthRepository _authRepository;
  final ComplaintRepository _complaintRepository;
  ComplaintController(this._authRepository, this._complaintRepository);

  final formKey = GlobalKey<FormState>();

  final nameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final descriptionTextController = TextEditingController();
  var archiveTextController;

  void complaint() async {
    if (formKey.currentState!.validate()) {
      try {
        await _complaintRepository.addComplaint(
          name: nameTextController.text,
          email: emailTextController.text,
          description: descriptionTextController.text,
        );
      } on ApiException catch (e) {
        Get.snackbar(e.title, e.message);
      } catch (e) {
        Get.snackbar("Erro", e.toString());
      }
    }
  }
}
