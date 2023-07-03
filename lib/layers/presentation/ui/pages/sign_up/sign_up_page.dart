import 'package:brasil_fields/brasil_fields.dart';
import 'package:easyflow/layers/domain/entities/course_entity.dart';
import 'package:easyflow/layers/domain/entities/study_area_entity.dart';
import 'package:easyflow/layers/presentation/controller/sign_up_controller.dart';
import 'package:easyflow/layers/presentation/ui/widgets/app_bar_widget.dart';
import 'package:easyflow/layers/presentation/ui/widgets/button_text_field_widget.dart';
import 'package:easyflow/layers/presentation/ui/widgets/listtile_widget.dart';
import 'package:easyflow/layers/presentation/ui/widgets/listview/listview_widget.dart';
import 'package:easyflow/layers/presentation/ui/widgets/modals_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/utils/validators_util.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
      final controller = GetIt.I.get<SignUpController>();
    CourseEntity? course;
    StudyAreaEntity? studyArea;
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
                      controller: controller.nameTextEditingController,
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
                      controller: controller.emailTextEditingController,
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
                      controller: controller.phoneTextEditingController,
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
                      onTap: () => Modals.page(
                          context: context,
                          title: const Text('Selecione o curso'),                                  
                             body: SafeArea(
                                  child: ListViewWidget<CourseEntity>(
                                      searchFieldEnabled: true,
                                      padding: const EdgeInsets.all(16),
                                      asyncListFilter: (value, list) => list
                                          .where(
                                            (element) => element.name
                                                .toLowerCase()
                                                .contains(value.toLowerCase()),
                                          )
                                          .toList(),
                                      onRefresh: () => controller.getCourses(),
                                      asyncListCallback: () =>
                                          controller.getCourses(),
                                      separatorBuilder: (p0, p1) =>
                                          const SizedBox(
                                            height: 16,
                                          ),
                                      builder: (_course) =>
                                          ListTileWidget(
                                              selected: course?.id ==
                                                      _course.id
                                                  ? true
                                                  : false,
                                              title: Text(_course.name),
                                              onTap: () {
                                                setState(() {
                                                  course = _course;
                                                  context.pop();
                                                });
                                              },),),
                                ),
                              ),
                      label: 'Curso',
                      controller: TextEditingController(
                          text: course?.name ?? ''),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ButtonTextFieldWidget(
                      validator: (value) => Validators.isNotEmpty(value),
                      onTap: () => Modals.page(
                          context: context,
                          title: const Text('Selecione a area de estudo'),
                             body: SafeArea(
                                  child: ListViewWidget<StudyAreaEntity>(
                                      searchFieldEnabled: true,
                                      padding: const EdgeInsets.all(16),
                                      asyncListFilter: (value, list) => list
                                          .where(
                                            (element) => element.name
                                                .toLowerCase()
                                                .contains(value.toLowerCase()),
                                          )
                                          .toList(),
                                      onRefresh: () => controller.getStudyAreas(),
                                      asyncListCallback: () =>
                                          controller.getStudyAreas(),
                                      separatorBuilder: (p0, p1) =>
                                          const SizedBox(
                                            height: 16,
                                          ),
                                      builder: (_studyArea) =>
                                          ListTileWidget(
                                              selected: studyArea?.id ==
                                                      _studyArea.id
                                                  ? true
                                                  : false,
                                              title: Text(_studyArea.name),
                                              onTap: () {
                                                setState(() {
                                                  studyArea = _studyArea;
                                                  context.pop();
                                                });
                                              },),),
                                ),
                              ),
                      label: 'Aréa de estudo',
                      controller: TextEditingController(
                          text: controller.studyArea?.name ?? ''),
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
