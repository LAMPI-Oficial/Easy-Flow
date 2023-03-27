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
}
