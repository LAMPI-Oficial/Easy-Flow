import 'package:brasil_fields/brasil_fields.dart';
import 'package:easyflow/layers/data/model/state_model.dart';
import 'package:easyflow/layers/modules/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../core/utils/validators_util.dart';
import '../sign_up_controller.dart';

class AddressSignUpPage extends GetView<SignUpController> {
  const AddressSignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(value: 2, subtitle: 'Dados residencias'),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: controller.formKeyAddress,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text("CEP"),
                      ),
                      controller: controller.cepTextController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text("Rua"),
                      ),
                      controller: controller.streetTextController,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => Validators.combine(
                        [
                          () => Validators.isNotEmpty(value),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              label: Text("Bairro"),
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
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              label: Text("Número"),
                            ),
                            controller: controller.numberTextController,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) => Validators.combine(
                              [() => Validators.isNotEmpty(value)],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              label: Text("Município"),
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
                        const SizedBox(
                          width: 8,
                        ),
                        SizedBox(
                          width: 100,
                          child: DropdownButtonFormField<String>(
                            decoration: const InputDecoration(
                              label: Text('UF'),
                            ),
                            items:
                                controller.states.map((StateModel stateModel) {
                              return DropdownMenuItem<String>(
                                value: stateModel.nome,
                                child: Text(stateModel.sigla),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              controller.state = value!;
                            },
                            validator: (value) =>
                                Validators.isNotSelected(value),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text("Complemento"),
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
              Container(
                padding: const EdgeInsets.all(16),
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => controller.address(context),
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
    );
  }
}
