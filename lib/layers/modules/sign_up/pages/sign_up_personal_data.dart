import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../../core/utils/validators_util.dart';
import '../../../widgets/text_field_secure_widget.dart';
import '../sign_up_controller.dart';

class SignUpPersonalData extends GetView<SignUpController> {
  SignUpPersonalData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: controller.formKey1,
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              height: 650,
              child: Column(
                children: [
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Cadastro",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Dados pessoais",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: SizedBox(
                            width: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              child: LinearProgressIndicator(
                                value: 1,
                                minHeight: 8,
                                backgroundColor: Color.fromRGBO(199, 211, 235, 1),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: SizedBox(
                            width: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              child: LinearProgressIndicator(
                                value: 0,
                                minHeight: 8,
                                backgroundColor: Color.fromRGBO(199, 211, 235, 1),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: SizedBox(
                            width: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              child: LinearProgressIndicator(
                                value: 0,
                                minHeight: 8,
                                backgroundColor: Color.fromRGBO(199, 211, 235, 1),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(12),
                    margin: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: SizedBox(
                        height: 380,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              TextFormField(
                                decoration: InputDecoration(
                                label: Text("Digite seu nome completo"),
                                  prefixIcon: Icon(Icons.badge_outlined),
                                hintText: "nome completo",
                                ),
                                controller: controller.nameTextController,
                                keyboardType: TextInputType.name,
                              
                                textInputAction: TextInputAction.next,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) => Validators.combine(
                                  [
                                    () => Validators.isNotEmpty(value),
                                    () => Validators.isName(value)
                                  ],
                                ),
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                label: Text("Digite seu e-mail"),
                                prefixIcon: Icon(Icons.email_outlined),
                                hintText: "e-mail",
                                ),
                                controller: controller.emailTextController,
                                
                                keyboardType: TextInputType.emailAddress,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                textInputAction: TextInputAction.next,
                                validator: (value) => Validators.combine(
                                  [
                                    () => Validators.isNotEmpty(value),
                                    () => Validators.isEmail(value)
                                  ],
                                ),
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                label: Text("Digite seu telefone"),
                                  prefixIcon: Icon(Icons.phone),
                                hintText: "Telefone",
                                ),
                                controller: controller.phoneTextController,
                              
                                keyboardType: TextInputType.phone,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                textInputAction: TextInputAction.next,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  TelefoneInputFormatter()
                                ],
                                validator: (value) => Validators.combine(
                                  [
                                    () => Validators.isNotEmpty(value),
                                    () => Validators.isPhone(value)
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 16),
                                child: Obx(
                                  () => DropdownButtonFormField(
                                    value: "${controller.dropdownCourseValue}",
                                    isExpanded: true,
                                    borderRadius: BorderRadius.circular(12),
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                          color: Color(0xFFD4D4D4),
                                        ),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                                      errorStyle: TextStyle(
                                        fontFamily: 'Segoe_UI',
                                      ),
                                    ),
                                    items:
                                        controller.courseList.map((String value) {
                                      if (controller.dropdownCourseValuePattern ==
                                          value) {
                                        return DropdownMenuItem<String>(
                                          enabled: false,
                                          value: value,
                                          child: Text(
                                            value,
                                            style: TextStyle(
                                                color: Colors.grey),
                                          ),
                                        );
                                      }
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (String? value) {
                                      controller.dropdownCourseValue.value =
                                          value!;
                                    },
                                    validator: (value) => Validators.combine(
                                      [
                                        () => Validators.isNotSelected(value),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Obx(
                                () => DropdownButtonFormField<String>(
                                  value:
                                      "${controller.dropdownAreaOfStudyValue}",
                                  isExpanded: true,
                                  borderRadius: BorderRadius.circular(12),
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        color: Color(0xFFD4D4D4),
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                                    errorStyle: const TextStyle(
                                      fontFamily: 'Segoe_UI',
                                    ),
                                  ),
                                  items: controller.areaOfStudyList
                                      .map((String value) {
                                    if (controller
                                            .dropdownAreaOfStudyValuePattern ==
                                        value) {
                                      return DropdownMenuItem<String>(
                                        enabled: false,
                                        value: value,
                                        child: Text(
                                          value,
                                          style: TextStyle(
                                              color: Colors.grey),
                                        ),
                                      );
                                    }
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (String? value) {
                                    controller.dropdownAreaOfStudyValue.value =
                                        value!;
                                  },
                                  validator: (value) => Validators.combine(
                                    [
                                      () => Validators.isNotSelected(value),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    width: double.infinity,
                    color: Colors.white,
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => controller.signUp1(context),
                            child: Text("Continuar"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
