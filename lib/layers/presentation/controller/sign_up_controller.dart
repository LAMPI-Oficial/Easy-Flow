import 'package:easyflow/layers/domain/entities/address_entity.dart';
import 'package:easyflow/layers/domain/entities/course_entity.dart';
import 'package:easyflow/layers/domain/entities/create_person_entity.dart';
import 'package:easyflow/layers/domain/entities/state_entity.dart';
import 'package:easyflow/layers/domain/entities/study_area_entity.dart';
import 'package:easyflow/layers/domain/exceptions/api_exception.dart';
import 'package:easyflow/layers/domain/usecases/create_person_usecase.dart';
import 'package:easyflow/layers/domain/usecases/get_courses_usecase.dart';
import 'package:easyflow/layers/domain/usecases/get_study_areas_usecase.dart';
import 'package:easyflow/layers/presentation/provider/user_provider.dart';
import 'package:easyflow/layers/presentation/ui/widgets/dialogs_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

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

  List<StateEntity> getListStates() {
    return [
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
  }

  signUp(BuildContext context, String page,
      final void Function(String) onPressedCallback) async {
    if (page == "personal") {
      if (formKeyPersonal.currentState!.validate()) {
        onPressedCallback(page);
      }
    } else if (page == "address") {
      if (formKeyAddress.currentState!.validate()) {
        print("atualizado para password");
        onPressedCallback(page);
      }
    } else if (page == "password") {
      if (formKeyPassword.currentState!.validate()) {
        onPressedCallback(page);
      }
    } else {
      if (formKeyRepeatPassword.currentState!.validate()) {
        signUp2(context);
      }
    }
  }

  signUp2(BuildContext context) async {
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
                  complement: complementTextEditingController.text),
              courseId: course!.id,
              studyAreaId: studyArea!.id))
          .then((user) {
        GetIt.I<UserProvider>().auth(user);
        Navigator.of(context).pushReplacementNamed('/home');
      });
    } on ApiException catch (e) {
      Navigator.of(context).pop();
      Dialogs.error(context, title: e.title, message: e.message);
    }
  }
}
