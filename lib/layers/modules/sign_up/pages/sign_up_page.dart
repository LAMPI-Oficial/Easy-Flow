import 'package:brasil_fields/brasil_fields.dart';
import 'package:easyflow/layers/widgets/app_bar_widget.dart';
import 'package:easyflow/layers/widgets/button_text_field_widget.dart';
import 'package:easyflow/layers/widgets/modals_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/validators_util.dart';
import '../sign_up_controller.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    final controller = GetIt.I.get<SignUpController>();
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
                    ButtonTextFieldWidget(
                      validator: (value) => Validators.isNotEmpty(value),
                      onTap: () => Modals.select(
                          context: context,
                          title: const Text('Selecione o curso'),
                          searchFieldEnabled: true,
                          padding: const EdgeInsets.all(16),
                          asyncListFilter: (value, list) => list
                              .where(
                                (element) => element
                                    .toLowerCase()
                                    .contains(value.toLowerCase()),
                              )
                              .toList(),
                          onRefresh: () => controller.getCourses(),
                          asyncListCallback: () => controller.getCourses(),
                          separatorBuilder: (p0, p1) => const SizedBox(
                                height: 16,
                              ),
                          builder: (_course) => ListTile(
                              selected:
                                  controller.course == _course ? true : false,
                              title: Text(_course),
                              tileColor: Colors.white,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  controller.course = _course;
                                  context.pop();
                                });
                              })),
                      label: 'Curso',
                      controller:
                          TextEditingController(text: controller.course),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ButtonTextFieldWidget(
                      validator: (value) => Validators.isNotEmpty(value),
                      onTap: () => Modals.select(
                          context: context,
                          title: const Text('Selecione a area de estudo'),
                          searchFieldEnabled: true,
                          padding: const EdgeInsets.all(16),
                          asyncListFilter: (value, list) => list
                              .where(
                                (element) => element
                                    .toLowerCase()
                                    .contains(value.toLowerCase()),
                              )
                              .toList(),
                          onRefresh: () => controller.getAreaOfStudys(),
                          asyncListCallback: () => controller.getAreaOfStudys(),
                          separatorBuilder: (p0, p1) => const SizedBox(
                                height: 16,
                              ),
                          builder: (_areaOfStudy) => ListTile(
                              selected: controller.areaOfStudy == _areaOfStudy
                                  ? true
                                  : false,
                              title: Text(_areaOfStudy),
                              tileColor: Colors.white,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  controller.areaOfStudy = _areaOfStudy;
                                  context.pop();
                                });
                              })),
                      label: 'Aréa de estudo',
                      controller: TextEditingController(
                          text: controller.areaOfStudy ?? ''),
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
