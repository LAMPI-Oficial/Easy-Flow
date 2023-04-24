import 'package:brasil_fields/brasil_fields.dart';
import 'package:easyflow/layers/modules/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../core/utils/validators_util.dart';
import '../sign_up_controller.dart';

class SignUpPage extends GetView<SignUpController> {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        value: 1,
        subtitle: 'Dados pessoais',
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: controller.formKeyPersonal,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text("Nome completo"),
                      ),
                      controller: controller.nameTextController,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => Validators.combine(
                        [
                          () => Validators.isNotEmpty(value),
                          () => Validators.isName(value)
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text("E-mail"),
                      ),
                      controller: controller.emailTextController,
                      keyboardType: TextInputType.emailAddress,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      textInputAction: TextInputAction.next,
                      validator: (value) => Validators.combine(
                        [
                          () => Validators.isNotEmpty(value),
                          () => Validators.isEmail(value)
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text("Telefone"),
                      ),
                      controller: controller.phoneTextController,
                      keyboardType: TextInputType.phone,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    const SizedBox(
                      height: 16,
                    ),
                    Obx(
                      () => DropdownButtonFormField(
                        value: "${controller.dropdownCourseValue}",
                        decoration: const InputDecoration(label: Text('Curso')),
                        items: controller.courseList.map((String value) {
                          if (controller.dropdownCourseValuePattern == value) {
                            return DropdownMenuItem<String>(
                              enabled: false,
                              value: value,
                              child: Text(
                                value,
                              ),
                            );
                          }
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          controller.dropdownCourseValue.value = value!;
                        },
                        validator: (value) => Validators.combine(
                          [
                            () => Validators.isNotSelected(value),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Obx(
                      () => DropdownButtonFormField<String>(
                        value: "${controller.dropdownAreaOfStudyValue}",
                        decoration: const InputDecoration(
                          label: Text('Areá de estudo'),
                        ),
                        items: controller.areaOfStudyList.map((String value) {
                          if (controller.dropdownAreaOfStudyValuePattern ==
                              value) {
                            return DropdownMenuItem<String>(
                              enabled: false,
                              value: value,
                              child: Text(
                                value,
                              ),
                            );
                          }
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          controller.dropdownAreaOfStudyValue.value = value!;
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
              Container(
                padding: const EdgeInsets.all(16),
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => controller.personal(context),
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
