import 'package:easyflow/layers/data/dto/study_area_dto.dart';
import 'package:easyflow/layers/domain/entities/course_entity.dart';
import 'package:easyflow/layers/domain/entities/enums/person_type_enum.dart';
import 'package:easyflow/layers/domain/entities/person_entity.dart';
import 'package:easyflow/layers/domain/entities/user_entity.dart';

class UserProvider {
  UserEntity? _userLogged = UserEntity(
      id: 1,
      token: 'token',
      login: 'login',
         studyArea: StudyAreaDto(id: 1, name: 'Programação web'),
          course: CourseEntity(id: 1, name: 'ADS - 1'),
      person: PersonEntity(
          id: 1,
          name: 'Michael Alves',
          email: 'maicon159951@outlook.com',
          admin: false,
       
          urlPhoto: '',
          personType: PersonType.student));
  bool logged = false;

  auth(UserEntity userModel) {
    _userLogged = userModel;
    logged = true;
  }

  logout() {
    _userLogged = null;
    logged = false;
  }

  UserEntity get userLogged => _userLogged!;
}
