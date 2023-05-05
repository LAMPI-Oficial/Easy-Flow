import 'package:brasil_fields/brasil_fields.dart';
import 'package:easyflow/layers/data/model/course_model.dart';
import 'package:easyflow/layers/data/model/study_area_model.dart';
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
    return FutureBuilder(
        future: Future.wait([
          controller.getAllCourses(),
          controller.getAllStudyArea(),
        ]),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
                body: Center(child: CircularProgressIndicator()));
          } else {
            final List<CourseModel> courses = snapshot.data![0];
            final List<StudyAreaModel> studyArea = snapshot.data![1];

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
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
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
                              const SizedBox(
                                height: 16,
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  label: Text("Telefone"),
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
                              const SizedBox(
                                height: 16,
                              ),
                              DropdownButtonFormField(
                                decoration:
                                    const InputDecoration(label: Text('Curso')),
                                items: courses.map((value) {
                                  return DropdownMenuItem<String>(
                                    value: value.id.toString(),
                                    child: Text(value.name),
                                  );
                                }).toList(),
                                onChanged: (String? value) {
                                  controller.course = value!;
                                },
                                validator: (value) =>
                                    Validators.isNotSelected(value),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              DropdownButtonFormField<String>(
                                decoration: const InputDecoration(
                                  label: Text('Área de estudo'),
                                ),
                                items: studyArea.map((value) {
                                  return DropdownMenuItem<String>(
                                    value: value.id.toString(),
                                    child: Text(value.name),
                                  );
                                }).toList(),
                                onChanged: (String? value) {
                                  controller.areaOfStudy = value!;
                                },
                                validator: (value) =>
                                    Validators.isNotSelected(value),
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
                ));
          }
        });
  }
}
