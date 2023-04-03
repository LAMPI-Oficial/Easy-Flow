import 'package:brasil_fields/brasil_fields.dart';
import 'package:easyflow/layers/modules/sign_up/pages/sign_up_password_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../../core/utils/validators_util.dart';
import '../../../widgets/text_field_secure_widget.dart';
import '../sign_up_controller.dart';
class SignUpResidentialData extends GetView<SignUpController> {
  SignUpResidentialData({Key? key}) : super(key: key);

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
                            "Dados residenciais",
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
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                      label: Text("Digite seu CEP"),
                                       prefixIcon: Icon(Icons.near_me),
                                      hintText: "CEP",
                                      ),
                                      controller: controller.cepTextController,
                                      keyboardType: TextInputType.number,
                                     
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
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                      label: Text("Digite sua rua"),
                                       prefixIcon:
                                      Icon(Icons.maps_home_work_outlined),
                                      hintText: "Rua",
                                      ),
                                      controller: controller.streetTextController,
                                      keyboardType: TextInputType.text,
                                     
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
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                      label: Text("Digite seu bairro"),
                                        prefixIcon: Icon(Icons.cable),
                                      hintText: "Bairro",
                                      ),
                                      controller: controller.neighborhoodTextController,
                                      keyboardType: TextInputType.text,
                                    
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
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                      label: Text("Número da sua casa"),
                                       prefixIcon: Icon(Icons.onetwothree_rounded),
                                      hintText: "Número",
                                      ),
                                      controller: controller.houseNumberTextController,
                                      keyboardType: TextInputType.text,
                                     
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
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                      label: Text("Digite seu município"),
                                       prefixIcon:
                                      Icon(Icons.location_city_outlined),
                                      hintText: "Município",
                                      ),
                                      controller: controller.municipalityTextController,
                                      keyboardType: TextInputType.text,
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
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                      label: Text("Digite seu estado"),
                                        prefixIcon: Icon(Icons.map_outlined),
                                      hintText: "Estado",
                                      ),
                                      controller: controller.stateTextController,
                                      keyboardType: TextInputType.text,
                                    
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
                              TextFormField(
                                decoration: const InputDecoration(
                                label: Text("Digite um complemento para o endereço"),
                                  prefixIcon: Icon(Icons.add_circle),
                                hintText: "Complemento",
                                ),
                                controller: controller.complementTextController,
                                keyboardType: TextInputType.text,
                              
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
                    EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    width: double.infinity,
                    color: Colors.white,
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => controller.signUp2(context),
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
