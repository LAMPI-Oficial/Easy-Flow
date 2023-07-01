import 'package:easyflow/layers/data/exceptions/api_exception.dart';
import 'package:easyflow/layers/data/model/create_user_request_model.dart';
import 'package:easyflow/layers/data/model/state_model.dart';
import 'package:easyflow/layers/data/repository/auth_repository.dart';
import 'package:easyflow/layers/data/service/user_service.dart';
import 'package:easyflow/layers/widgets/dialogs_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class SignUpController {
  final AuthRepository _authRepository;
  SignUpController(this._authRepository);

  final formKeyPersonal = GlobalKey<FormState>();
  final formKeyAddress = GlobalKey<FormState>();
  final formKeyPassword = GlobalKey<FormState>();
  final formKeyRepeatPassword = GlobalKey<FormState>();

  final nameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final phoneTextController = TextEditingController();
  final courseTextController = TextEditingController();
  final areaOfStudyTextController = TextEditingController();
  final List<String> courses = ["Redes", "ADS", "Eventos"];
  String? course;
  final List<String> areaOfStudys = ["Programação WEB", "UX/UI", "Jogos"];
  String? areaOfStudy;

  final cepTextController = TextEditingController();
  final streetTextController = TextEditingController();
  final neighborhoodTextController = TextEditingController();
  final numberTextController = TextEditingController();
  final municipalityTextController = TextEditingController();
  String? state;
  final complementTextController = TextEditingController();

  final passwordTextController = TextEditingController();
  final repeatPasswordTextController = TextEditingController();

  personal(BuildContext context) async {
    if (formKeyPersonal.currentState!.validate()) {
      context.push('/signup/address');
    }
  }

  address(BuildContext context) async {
    if (formKeyAddress.currentState!.validate()) {
      context.push('/signup/password');
    }
  }

  password(BuildContext context) async {
    if (formKeyPassword.currentState!.validate()) {
      context.push('/signup/repeat_password');
    }
  }

  repeatPassword(context) async {
    if (formKeyRepeatPassword.currentState!.validate()) {
      signUp(context);
    }
  }

  signUp(BuildContext context) async {
    Dialogs.loading(context);
    try {
      _authRepository
          .signUp(CreateUserRequestModel(
        name: nameTextController.text,
        email: emailTextController.text,
        phone: phoneTextController.text,
        password: passwordTextController.text,
        repeatPassword: repeatPasswordTextController.text,
      ))
          .then((user) {
        GetIt.I<UserService>().auth(user);
        Navigator.of(context).pushReplacementNamed('/home');
      });
    } on ApiException catch (e) {
      Navigator.of(context).pop();
      Dialogs.error(context, title: e.title, message: e.message);
    }
  }

  List<StateModel> states = [
    StateModel(nome: 'Acre', sigla: 'AC'),
    StateModel(nome: 'Alagoas', sigla: 'AL'),
    StateModel(nome: 'Amapá', sigla: 'AP'),
    StateModel(nome: 'Amazonas', sigla: 'AM'),
    StateModel(nome: 'Bahia', sigla: 'BA'),
    StateModel(nome: 'Ceará', sigla: 'CE'),
    StateModel(nome: 'Distrito Federal', sigla: 'DF'),
    StateModel(nome: 'Espírito Santo', sigla: 'ES'),
    StateModel(nome: 'Goiás', sigla: 'GO'),
    StateModel(nome: 'Maranhão', sigla: 'MA'),
    StateModel(nome: 'Mato Grosso', sigla: 'MT'),
    StateModel(nome: 'Mato Grosso do Sul', sigla: 'MS'),
    StateModel(nome: 'Minas Gerais', sigla: 'MG'),
    StateModel(nome: 'Pará', sigla: 'PA'),
    StateModel(nome: 'Paraíba', sigla: 'PB'),
    StateModel(nome: 'Paraná', sigla: 'PR'),
    StateModel(nome: 'Pernambuco', sigla: 'PE'),
    StateModel(nome: 'Piauí', sigla: 'PI'),
    StateModel(nome: 'Rio de Janeiro', sigla: 'RJ'),
    StateModel(nome: 'Rio Grande do Norte', sigla: 'RN'),
    StateModel(nome: 'Rio Grande do Sul', sigla: 'RS'),
    StateModel(nome: 'Rondônia', sigla: 'RO'),
    StateModel(nome: 'Roraima', sigla: 'RR'),
    StateModel(nome: 'Santa Catarina', sigla: 'SC'),
    StateModel(nome: 'São Paulo', sigla: 'SP'),
    StateModel(nome: 'Sergipe', sigla: 'SE'),
    StateModel(nome: 'Tocantins', sigla: 'TO'),
  ];
}
