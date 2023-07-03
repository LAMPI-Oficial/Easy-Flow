import 'package:easyflow/layers/domain/entities/address_entity.dart';
import 'package:easyflow/layers/domain/entities/course_entity.dart';
import 'package:easyflow/layers/domain/entities/create_person_entity.dart';
import 'package:easyflow/layers/domain/entities/study_area_entity.dart';
import 'package:easyflow/layers/domain/exceptions/api_exception.dart';
import 'package:easyflow/layers/domain/entities/state_model.dart';
import 'package:easyflow/layers/domain/usecases/create_person_usecase.dart';
import 'package:easyflow/layers/domain/usecases/get_courses_usecase.dart';
import 'package:easyflow/layers/domain/usecases/get_study_areas_usecase.dart';
import 'package:easyflow/layers/presentation/provider/user_provider.dart';
import 'package:easyflow/layers/presentation/ui/widgets/dialogs_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class SignUpController {
  final GetCoursesUseCase _getCoursesIdUseCase;
  final GetStudyAreasUseCase _getStudyAreasUseCase;
  final CreatePersonUseCase _createPersonUseCase;
  SignUpController(this._getCoursesIdUseCase, this._getStudyAreasUseCase,
      this._createPersonUseCase);

  final formKeyPersonal = GlobalKey<FormState>();
  final formKeyAddress = GlobalKey<FormState>();
  final formKeyPassword = GlobalKey<FormState>();
  final formKeyRepeatPassword = GlobalKey<FormState>();

  final nameTextEditingController = TextEditingController();
  final emailTextEditingController = TextEditingController();
  final phoneTextEditingController = TextEditingController();
  final courseTextEditingController = TextEditingController();
  final areaOfStudyTextEditingController = TextEditingController();
  CourseEntity? course;
  StudyAreaEntity? studyArea;

  Future<List<CourseEntity>> getCourses() async {
    return _getCoursesIdUseCase.call();
  }

  Future<List<StudyAreaEntity>> getStudyAreas() async {
    return _getStudyAreasUseCase.call();
  }

  final cepTextEditingController = TextEditingController();
  final streetTextEditingController = TextEditingController();
  final districtTextEditingController = TextEditingController();
  final numberTextEditingController = TextEditingController();
  final cityTextEditingController = TextEditingController();
  String? state;
  final complementTextEditingController = TextEditingController();

  final passwordTextEditingController = TextEditingController();
  final repeatPasswordTextEditingController = TextEditingController();

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
      _createPersonUseCase
          .call(CreatePersonEntity(
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
                  complement: complementTextEditingController.text), courseId: course!.id, studyAreaId: studyArea!.id))
          .then((user) {
        GetIt.I<UserProvider>().auth(user);
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
