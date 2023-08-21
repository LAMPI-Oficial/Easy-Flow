import 'package:brasil_fields/brasil_fields.dart';
import 'package:easyflow/layers/domain/entities/address_entity.dart';
import 'package:easyflow/layers/domain/entities/course_entity.dart';
import 'package:easyflow/layers/domain/entities/create_person_entity.dart';
import 'package:easyflow/layers/domain/entities/state_entity.dart';
import 'package:easyflow/layers/domain/entities/study_area_entity.dart';
import 'package:easyflow/layers/domain/exceptions/api_exception.dart';
import 'package:easyflow/layers/presentation/controller/sign_up_controller.dart';
import 'package:easyflow/layers/presentation/provider/user_provider.dart';
import 'package:easyflow/layers/presentation/ui/widgets/app_bar_widget.dart';
import 'package:easyflow/layers/presentation/ui/widgets/button_text_field_widget.dart';
import 'package:easyflow/layers/presentation/ui/widgets/dialogs_widget.dart';
import 'package:easyflow/layers/presentation/ui/widgets/listtile_widget.dart';
import 'package:easyflow/layers/presentation/ui/widgets/listview/listview_widget.dart';
import 'package:easyflow/layers/presentation/ui/widgets/modals_widget.dart';
import 'package:easyflow/layers/presentation/ui/widgets/text_field_secure_widget.dart';
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
  String page = "personal";

  List<StateEntity> states = [
    StateEntity(nome: 'Acre', sigla: 'AC'),
    StateEntity(nome: 'Alagoas', sigla: 'AL'),
    StateEntity(nome: 'Amapá', sigla: 'AP'),
    StateEntity(nome: 'Amazonas', sigla: 'AM'),
    StateEntity(nome: 'Bahia', sigla: 'BA'),
    StateEntity(nome: 'Ceará', sigla: 'CE'),
    StateEntity(nome: 'Distrito Federal', sigla: 'DF'),
    StateEntity(nome: 'Espírito Santo', sigla: 'ES'),
    StateEntity(nome: 'Goiás', sigla: 'GO'),
    StateEntity(nome: 'Maranhão', sigla: 'MA'),
    StateEntity(nome: 'Mato Grosso', sigla: 'MT'),
    StateEntity(nome: 'Mato Grosso do Sul', sigla: 'MS'),
    StateEntity(nome: 'Minas Gerais', sigla: 'MG'),
    StateEntity(nome: 'Pará', sigla: 'PA'),
    StateEntity(nome: 'Paraíba', sigla: 'PB'),
    StateEntity(nome: 'Paraná', sigla: 'PR'),
    StateEntity(nome: 'Pernambuco', sigla: 'PE'),
    StateEntity(nome: 'Piauí', sigla: 'PI'),
    StateEntity(nome: 'Rio de Janeiro', sigla: 'RJ'),
    StateEntity(nome: 'Rio Grande do Norte', sigla: 'RN'),
    StateEntity(nome: 'Rio Grande do Sul', sigla: 'RS'),
    StateEntity(nome: 'Rondônia', sigla: 'RO'),
    StateEntity(nome: 'Roraima', sigla: 'RR'),
    StateEntity(nome: 'Santa Catarina', sigla: 'SC'),
    StateEntity(nome: 'São Paulo', sigla: 'SP'),
    StateEntity(nome: 'Sergipe', sigla: 'SE'),
    StateEntity(nome: 'Tocantins', sigla: 'TO'),
  ];

  final formKeyPersonal = GlobalKey<FormState>();
  final formKeyAddress = GlobalKey<FormState>();
  final formKeyPassword = GlobalKey<FormState>();
  final formKeyRepeatPassword = GlobalKey<FormState>();

  final nameTextEditingController = TextEditingController();
  final emailTextEditingController = TextEditingController();
  final phoneTextEditingController = TextEditingController();
  final courseTextEditingController = TextEditingController();
  final areaOfStudyTextEditingController = TextEditingController();

  final cepTextEditingController = TextEditingController();
  final streetTextEditingController = TextEditingController();
  final districtTextEditingController = TextEditingController();
  final numberTextEditingController = TextEditingController();
  final cityTextEditingController = TextEditingController();
  String? state;
  final complementTextEditingController = TextEditingController();

  final passwordTextEditingController = TextEditingController();
  final repeatPasswordTextEditingController = TextEditingController();

  save() {
    if (formKeyRepeatPassword.currentState!.validate()) {
      Dialogs.loading(context);
      try {
        controller
            .signUp(CreatePersonEntity(
                name: nameTextEditingController.text,
                email: emailTextEditingController.text,
                phone: phoneTextEditingController.text,
                password: passwordTextEditingController.text,
                repeatPassword: repeatPasswordTextEditingController.text,
                address: AddressEntity(
                    cep: cepTextEditingController.text,
                    state: state!,
                    city: cityTextEditingController.text,
                    district: districtTextEditingController.text,
                    street: streetTextEditingController.text,
                    number: numberTextEditingController.text,
                    complement: complementTextEditingController.text),
                courseId: course!.id,
                studyAreaId: studyArea!.id))
            .then((user) {
          GetIt.I<UserProvider>().auth(user);
          setState(() {
            page = "success";
          });
        });
      } on ApiException catch (e) {
        Navigator.of(context).pop();
        Dialogs.error(context, title: e.title, message: e.message);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (page == "personal") {
      return Scaffold(
        appBar: AppBarWidget(
          value: 1,
          subtitle: 'Dados pessoais',
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Form(
            key: formKeyPersonal,
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
                        controller: nameTextEditingController,
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
                        controller: emailTextEditingController,
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
                        controller: phoneTextEditingController,
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
                                selected:
                                    course?.id == _course.id ? true : false,
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
                        controller:
                            TextEditingController(text: course?.name ?? ''),
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
                              separatorBuilder: (p0, p1) => const SizedBox(
                                height: 16,
                              ),
                              builder: (_studyArea) => ListTileWidget(
                                selected: studyArea?.id == _studyArea.id
                                    ? true
                                    : false,
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
                            TextEditingController(text: studyArea?.name ?? ''),
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
                          onPressed: () {
                            if (formKeyPersonal.currentState!.validate()) {
                              setState(() {
                                page = "address";
                              });
                            }
                          },
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
    } else if (page == "address") {
      return WillPopScope(
        onWillPop: () async {
          setState(() {
            page = "personal";
          });
          return false;
        },
        child: Scaffold(
          appBar: AppBarWidget(value: 2, subtitle: 'Dados residencias'),
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Form(
              key: formKeyAddress,
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
                          controller: cepTextEditingController,
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
                          controller: streetTextEditingController,
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
                                controller: districtTextEditingController,
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
                                controller: numberTextEditingController,
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
                                controller: cityTextEditingController,
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
                                  label: Text('Estado'),
                                ),
                                items: states.map((StateEntity state) {
                                  return DropdownMenuItem<String>(
                                    value: state.nome,
                                    child: Text(state.sigla),
                                  );
                                }).toList(),
                                onChanged: (String? value) {
                                  state = value!;
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
                          controller: complementTextEditingController,
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
                            onPressed: () {
                              if (formKeyAddress.currentState!.validate()) {
                                setState(() {
                                  page = "password";
                                });
                              }
                            },
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
      );
    } else if (page == "password") {
      return WillPopScope(
        onWillPop: () async {
          setState(() {
            page = "address";
          });
          return false;
        },
        child: Scaffold(
          appBar: AppBarWidget(value: 3, subtitle: 'Senha'),
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Form(
              key: formKeyPassword,
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.all(16),
                      children: [
                        TextFieldSecureWidget(
                          label: "Senha",
                          controller: passwordTextEditingController,
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
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    width: double.infinity,
                    color: Colors.white,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKeyPassword.currentState!.validate()) {
                          setState(() {
                            page = "repeat_password";
                          });
                        }
                      },
                      child: const Text("Continuar"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    } else if (page == "repeat_password") {
      return WillPopScope(
        onWillPop: () async {
          setState(() {
            page = "password";
          });
          return false;
        },
        child: Scaffold(
          appBar: AppBarWidget(value: 4, subtitle: 'Confirmar senha'),
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Form(
              key: formKeyRepeatPassword,
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.all(16),
                      children: [
                        TextFieldSecureWidget(
                          label: "Senha novamente",
                          controller: repeatPasswordTextEditingController,
                          textInputAction: TextInputAction.next,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          security: true,
                          validator: (value) => Validators.combine(
                            [
                              () => Validators.isNotEmpty(value),
                              () => Validators.isEqualPassword(
                                  passwordTextEditingController.text, "$value")
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
                    child: ElevatedButton(
                      onPressed: save,
                      child: const Text("Finalizar"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              height: 600,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.fact_check_outlined,
                      color: Colors.green,
                      size: 100,
                    ),
                  ),
                  const Padding(
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
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, "/home");
                        },
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.blue),
                        ),
                        child: const Text(
                          "Início",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Segoe UI',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
}
