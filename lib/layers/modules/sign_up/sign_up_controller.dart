import 'package:easyflow/core/routes/app_pages.dart';
import 'package:easyflow/layers/data/exceptions/api_exception.dart';
import 'package:easyflow/layers/data/model/course_model.dart';
import 'package:easyflow/layers/data/model/create_adress_request_model.dart';
import 'package:easyflow/layers/data/model/create_user_request_model.dart';
import 'package:easyflow/layers/data/model/state_model.dart';
import 'package:easyflow/layers/data/model/study_area_model.dart';
import 'package:easyflow/layers/data/repository/adress_repository.dart';
import 'package:easyflow/layers/data/repository/auth_repository.dart';
import 'package:easyflow/layers/data/repository/course_repository.dart';
import 'package:easyflow/layers/data/repository/study_area_repository.dart';
import 'package:easyflow/layers/data/service/user_service.dart';
import 'package:easyflow/layers/widgets/dialogs_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final AuthRepository _authRepository;
  final AdressRepository _adressRepository;
  final StudyAreaRepository _studyAreaRepository;
  final CourseRepository _courseRepository;

  SignUpController(
    this._authRepository,
    this._adressRepository,
    this._courseRepository,
    this._studyAreaRepository,
  );

  final formKeyPersonal = GlobalKey<FormState>();
  final formKeyAddress = GlobalKey<FormState>();
  final formKeyPassword = GlobalKey<FormState>();
  final formKeyRepeatPassword = GlobalKey<FormState>();

  final nameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final phoneTextController = TextEditingController();
  final courseTextController = TextEditingController();
  final areaOfStudyTextController = TextEditingController();
  RxList<CourseModel> courses = <CourseModel>[].obs;
  String? course;
  RxList<StudyAreaModel> study_area = <StudyAreaModel>[].obs;
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

  personal(context) async {
    if (formKeyPersonal.currentState!.validate()) {
      Navigator.of(context).pushNamed(Routes.ADDRESS_SIGN_UP);
    }
  }

  address(context) async {
    if (formKeyAddress.currentState!.validate()) {
      Navigator.of(context).pushNamed(Routes.PASSWORD_SIGN_UP);
    }
  }

  password(context) async {
    if (formKeyPassword.currentState!.validate()) {
      Navigator.of(context).pushNamed(Routes.REPEAT_PASSWORD_SIGN_UP);
    }
  }

  repeatPassword(context) async {
    if (formKeyRepeatPassword.currentState!.validate()) {
      signUp(context);
    }
  }

  signUp(context) async {
    Dialogs.loading(context);
    try {
      await _authRepository
          .signUp(CreateUserRequestModel(
        name: nameTextController.text,
        email: emailTextController.text,
        phone: phoneTextController.text,
        password: passwordTextController.text,
        repeatPassword: repeatPasswordTextController.text,
        course: course ?? '',
        studyArea: areaOfStudy ?? '',
      ))
          .then((user) async {
        try {
          await _adressRepository
              .save(CreateAdressRequestModel(
            complement: complementTextController.text,
            municipality: municipalityTextController.text,
            neighborhood: neighborhoodTextController.text,
            number: numberTextController.text,
            personId: "${user.id}",
            stateEnum: state!.toUpperCase() ?? '',
            street: streetTextController.text,
          ))
              .then((res) {
                if(res == "ok"){
                  Get.put(UserService()).auth(user);
                  Navigator.of(context).pushNamed(Routes.HOME);
                }
          });
        } on ApiException catch (e) {
          Navigator.of(context).pop();
          Dialogs.error(context, title: e.title, message: e.message);
        }
      });
    } on ApiException catch (e) {
      Navigator.of(context).pop();
      Dialogs.error(context, title: e.title, message: e.message);
    }
  }

  Future<List<CourseModel>> getAllCourses() {
    return _courseRepository.getAll().then((value) => courses(value));
  }

  Future<List<StudyAreaModel>> getAllStudyArea() {
    return _studyAreaRepository.getAll().then((value) => study_area(value));
  }

  List<StateModel> states = [
    StateModel(nome: 'Acre', sigla: 'AC'),
    StateModel(nome: 'Alagoas', sigla: 'AL'),
    StateModel(nome: 'Amapa', sigla: 'AP'),
    StateModel(nome: 'Amazonas', sigla: 'AM'),
    StateModel(nome: 'Bahia', sigla: 'BA'),
    StateModel(nome: 'Ceara', sigla: 'CE'),
    StateModel(nome: 'Distrito_Federal', sigla: 'DF'),
    StateModel(nome: 'Espirito_Santo', sigla: 'ES'),
    StateModel(nome: 'Goias', sigla: 'GO'),
    StateModel(nome: 'Maranhao', sigla: 'MA'),
    StateModel(nome: 'Mato_Grosso', sigla: 'MT'),
    StateModel(nome: 'Mato_Grosso_do_Sul', sigla: 'MS'),
    StateModel(nome: 'Minas_Gerais', sigla: 'MG'),
    StateModel(nome: 'Para', sigla: 'PA'),
    StateModel(nome: 'Paraiba', sigla: 'PB'),
    StateModel(nome: 'Parana', sigla: 'PR'),
    StateModel(nome: 'Pernambuco', sigla: 'PE'),
    StateModel(nome: 'Piaui', sigla: 'PI'),
    StateModel(nome: 'Rio_de_Janeiro', sigla: 'RJ'),
    StateModel(nome: 'Rio_Grande_do_Norte', sigla: 'RN'),
    StateModel(nome: 'Rio_Grande_do_Sul', sigla: 'RS'),
    StateModel(nome: 'Rondonia', sigla: 'RO'),
    StateModel(nome: 'Roraima', sigla: 'RR'),
    StateModel(nome: 'Santa_Catarina', sigla: 'SC'),
    StateModel(nome: 'Sao_Paulo', sigla: 'SP'),
    StateModel(nome: 'Sergipe', sigla: 'SE'),
    StateModel(nome: 'Tocantins', sigla: 'TO'),
  ];
}
