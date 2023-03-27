import 'package:brasil_fields/brasil_fields.dart';
import 'package:easyflow/layers/modules/sign_up/pages/sign_up_password_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../../core/utils/validators_util.dart';
import '../../../widgets/text_field_widget.dart';
import '../sign_up_controller.dart';
class SignUpResidentialData extends GetView<SignUpController> {
  const SignUpResidentialData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: controller.formKey2,
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              height: 650,
              child: Column(
                children: [
                  const Expanded(
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
                            "Dados residenciais",
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )),
                  const Padding(
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
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.only(top: 20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                        height: 380,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFieldWidget(
                                      label: "Digite seu CEP",
                                      hintText: "CEP",
                                      controller: controller.cepTextController,
                                      keyboardType: TextInputType.number,
                                      prefixIcon: const Icon(Icons.near_me),
                                      textInputAction: TextInputAction.next,
                                      autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        CepInputFormatter()
                                      ],
                                      validator: (value) => Validators.combine(
                                        [
                                              () => Validators.isNotEmpty(value),
                                              () => Validators.isCep(value)
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 8,
                                  ),
                                  Expanded(
                                    child: TextFieldWidget(
                                      label: "Digite sua rua",
                                      hintText: "Rua",
                                      controller: controller.streetTextController,
                                      keyboardType: TextInputType.text,
                                      prefixIcon:
                                      const Icon(Icons.maps_home_work_outlined),
                                      textInputAction: TextInputAction.next,
                                      autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                      validator: (value) => Validators.combine(
                                        [
                                              () => Validators.isNotEmpty(value),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFieldWidget(
                                      label: "Digite seu bairro",
                                      hintText: "Bairro",
                                      controller: controller.neighborhoodTextController,
                                      keyboardType: TextInputType.text,
                                      prefixIcon: const Icon(Icons.cable),
                                      textInputAction: TextInputAction.next,
                                      autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                      validator: (value) => Validators.combine(
                                        [
                                              () => Validators.isNotEmpty(value),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 8,
                                  ),
                                  Expanded(
                                    child: TextFieldWidget(
                                      label: "Número da sua casa",
                                      hintText: "Número",
                                      controller: controller.houseNumberTextController,
                                      keyboardType: TextInputType.text,
                                      prefixIcon: const Icon(Icons.onetwothree_rounded),
                                      textInputAction: TextInputAction.next,
                                      autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                      validator: (value) => Validators.combine(
                                        [
                                              () => Validators.isNotEmpty(value)
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFieldWidget(
                                      label: "Digite seu município",
                                      hintText: "Município",
                                      controller: controller.municipalityTextController,
                                      keyboardType: TextInputType.text,
                                      prefixIcon:
                                      const Icon(Icons.location_city_outlined),
                                      textInputAction: TextInputAction.next,
                                      autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                      validator: (value) => Validators.combine(
                                        [
                                              () => Validators.isNotEmpty(value),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 8,
                                  ),
                                  Expanded(
                                    child: TextFieldWidget(
                                      label: "Digite seu estado",
                                      hintText: "Estado",
                                      controller: controller.stateTextController,
                                      keyboardType: TextInputType.text,
                                      prefixIcon: const Icon(Icons.map_outlined),
                                      textInputAction: TextInputAction.next,
                                      autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                      validator: (value) => Validators.combine(
                                        [
                                              () => Validators.isNotEmpty(value),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              TextFieldWidget(
                                label: "Digite um complemento para o endereço",
                                hintText: "Complemento",
                                controller: controller.complementTextController,
                                keyboardType: TextInputType.text,
                                prefixIcon: const Icon(Icons.add_circle),
                                textInputAction: TextInputAction.next,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: (value) => Validators.combine(
                                  [
                                        () => Validators.isNotEmpty(value),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    width: double.infinity,
                    color: Colors.white,
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => controller.signUp2(context),
                            child: const Text("Continuar"),
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
