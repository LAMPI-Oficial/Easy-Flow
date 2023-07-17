import 'package:brasil_fields/brasil_fields.dart';
import 'package:easyflow/core/utils/validators_util.dart';
import 'package:easyflow/layers/domain/entities/course_entity.dart';
import 'package:easyflow/layers/domain/entities/state_entity.dart';
import 'package:easyflow/layers/domain/entities/study_area_entity.dart';
import 'package:easyflow/layers/presentation/controller/sign_up_controller.dart';
import 'package:easyflow/layers/presentation/ui/widgets/app_bar_widget.dart';
import 'package:easyflow/layers/presentation/ui/widgets/button_text_field_widget.dart';
import 'package:easyflow/layers/presentation/ui/widgets/listtile_widget.dart';
import 'package:easyflow/layers/presentation/ui/widgets/listview/listview_widget.dart';
import 'package:easyflow/layers/presentation/ui/widgets/modals_widget.dart';
import 'package:easyflow/layers/presentation/ui/widgets/text_field_secure_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  //Define a página de cadastro
  String signUpPage = "personal";

  final controller = GetIt.I.get<SignUpController>();
  CourseEntity? course;
  StudyAreaEntity? studyArea;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (signUpPage == "personal") {
          return true;
        } else {
          beforePage(signUpPage);
          return false;
        }
      },
      child: Scaffold(
        appBar: (signUpPage != "success"
            ? AppBarWidget(
                value: getAppBarStatus(signUpPage),
                subtitle: getAppBarText(signUpPage),
              )
            : null),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Form(
            key: getkeyController(signUpPage),
            child: Column(
              children: [
                Expanded(
                  child: getForm(signUpPage),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  width: double.infinity,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(
                        child: (signUpPage != "success"
                            ? ElevatedButton(
                                onPressed: () => controller.signUp(
                                    context, signUpPage, nextPage),
                                child: Text((signUpPage == "repeat_password"
                                    ? "Finalizar"
                                    : "Continuar")),
                              )
                            : ElevatedButton(
                                onPressed: () {
                                  context.pop();
                                },
                                child: const Text("Início"),
                              )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void nextPage(String page) {
    if (page == "personal") {
      setState(() {
        signUpPage = "address";
      });
    } else if (page == "address") {
      setState(() {
        signUpPage = "password";
      });
    } else if (page == "password") {
      setState(() {
        signUpPage = "repeat_password";
      });
    } else if (page == "repeat_password") {
      setState(() {
        signUpPage = "success";
      });
    }
  }

  void beforePage(String page) {
    if (page == "success") {
      setState(() {
        signUpPage = "personal";
      });
    } else if (page == "repeat_password") {
      setState(() {
        signUpPage = "password";
      });
    } else if (page == "password") {
      setState(() {
        signUpPage = "address";
      });
    } else if (page == "address") {
      setState(() {
        signUpPage = "personal";
      });
    }
  }

  int getAppBarStatus(String page) {
    if (page == "personal") {
      return 1;
    } else if (page == "address") {
      return 2;
    } else if (page == "password") {
      return 3;
    } else {
      return 4;
    }
  }

  String getAppBarText(String page) {
    if (page == "personal") {
      return "Dados pessoais";
    } else if (page == "address") {
      return "Dados residenciais";
    } else if (page == "password") {
      return "Senha";
    } else {
      return "Confirmar senha";
    }
  }

  Key getkeyController(String page) {
    if (page == "personal") {
      return controller.formKeyPersonal;
    } else if (page == "address") {
      return controller.formKeyAddress;
    } else if (page == "password") {
      return controller.formKeyPassword;
    } else {
      return controller.formKeyRepeatPassword;
    }
  }

  Widget getForm(String page) {
    if (page == "personal") {
      return ListView(
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
                  asyncListCallback: () => controller.getCourses(),
                  separatorBuilder: (p0, p1) => const SizedBox(
                    height: 16,
                  ),
                  builder: (_course) => ListTileWidget(
                    selected: course?.id == _course.id ? true : false,
                    title: Text(_course.name),
                    onTap: () {
                      setState(() {
                        course = _course;
                        context.pop();
                      });
                    },
                  ),
                ),
              ),
            ),
            label: 'Curso',
            controller: TextEditingController(text: course?.name ?? ''),
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
                  asyncListCallback: () => controller.getStudyAreas(),
                  separatorBuilder: (p0, p1) => const SizedBox(
                    height: 16,
                  ),
                  builder: (_studyArea) => ListTileWidget(
                    selected: studyArea?.id == _studyArea.id ? true : false,
                    title: Text(_studyArea.name),
                    onTap: () {
                      setState(() {
                        studyArea = _studyArea;
                        context.pop();
                      });
                    },
                  ),
                ),
              ),
            ),
            label: 'Aréa de estudo',
            controller:
                TextEditingController(text: controller.studyArea?.name ?? ''),
          ),
        ],
      );
    } else if (page == "address") {
      return ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextFormField(
            decoration: const InputDecoration(
              label: Text("CEP"),
            ),
            controller: controller.cepTextEditingController,
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
            controller: controller.streetTextEditingController,
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
                  controller: controller.districtTextEditingController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
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
                  controller: controller.numberTextEditingController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
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
                  controller: controller.cityTextEditingController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    label: Text('Estado'),
                  ),
                  items: controller.getListStates().map((StateEntity state) {
                    return DropdownMenuItem<String>(
                      value: state.nome,
                      child: Text(state.sigla),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    controller.state = value!;
                  },
                  validator: (value) => Validators.isNotSelected(value),
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
            controller: controller.complementTextEditingController,
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
      );
    } else if (page == "password") {
      return ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextFieldSecureWidget(
            label: "Senha",
            controller: controller.passwordTextEditingController,
            textInputAction: TextInputAction.next,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            security: true,
            validator: (value) => Validators.combine(
              [
                () => Validators.isNotEmpty(value),
                () => Validators.isPassword(value)
              ],
            ),
          ),
        ],
      );
    } else if (page == "repeat_password") {
      return ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextFieldSecureWidget(
            label: "Senha novamente",
            controller: controller.repeatPasswordTextEditingController,
            textInputAction: TextInputAction.next,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            security: true,
            validator: (value) => Validators.combine(
              [
                () => Validators.isNotEmpty(value),
                () => Validators.isEqualPassword(
                    controller.passwordTextEditingController.text, "$value")
              ],
            ),
          ),
        ],
      );
    } else {
      return const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.fact_check_outlined,
              color: Colors.green,
              size: 100,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Cadastro finalizado",
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      );
    }
  }
}
