import 'package:easyflow/layers/data/dto/person_dto.dart';
import 'package:easyflow/layers/domain/entities/course_entity.dart';
import 'package:easyflow/layers/domain/entities/enums/person_type_enum.dart';
import 'package:easyflow/layers/domain/entities/person_entity.dart';
import 'package:easyflow/layers/domain/entities/study_area_entity.dart';
import 'package:easyflow/layers/domain/entities/user_entity.dart';

class UserDto extends UserEntity {
  UserDto({
    required int id,
    required String token,
    required String login,
    required PersonEntity person,
    required CourseEntity course,
    required StudyAreaEntity studyArea,
  }) : super(
          id: id,
          token: token,
          login: login,
          person: person,
          course: course,
          studyArea: studyArea,
        );

  Map toMap() {
    return {
      "user": {
        "id": id,
        "login": login,
        "token": token,
        "course_id": course.id,
        "course_name": course.name,
        "studyArea_id": studyArea.id,
        "studyArea_name": studyArea.name,
        "tb_person": {
          "id": id,
          "urlPhoto": person.urlPhoto,
          "name": person.name,
          "email": person.email,
          "admin": person.admin,
          "representative":
              person.personType == PersonType.representative ? true : false,
        },
      }
    };
  }

  static UserDto fromMap(Map map) {
    return UserDto(
      id: map["user"]["id"],
      token: map["user"]["token"],
      login: map['user']['login'],
      course: CourseEntity(
          id: map['user']['course_id'], name: map['user']['course_name']),
      studyArea: StudyAreaEntity(
          id: map['user']['studyArea_id'], name: map['user']['studyArea_name']),
      person: PersonDto.fromMap(
        map['user']['tb_person'],
      ),
    );
  }
}

// import 'package:easyflow/layers/data/dto/person_dto.dart';
// import 'package:easyflow/layers/domain/entities/person_entity.dart';
// import 'package:easyflow/layers/domain/entities/user_entity.dart';

// class UserDto extends UserEntity {
//   UserDto({
//     required int id,
//     required String token,
//     required String login,
//     required bool active,
//     required PersonEntity person,
//   }) : super(
//           id: id,
//           token: token,
//           login: login,
//           active: active,
//           person: person,
//         );

//   Map toMap() {
//     return {
//       "active": active,
//       "id": id,
//       "login": login,
//       "person": person,
//     };
//   }

//   static UserDto fromMap(Map map) {
//     return UserDto(
//       id: map["user"]["id"],
//       token: map["token"]["value"],
//       login: map['user']['login'],
//       active: map['user']['active'],
//       person: PersonDto.fromMap(
//         map['user']['person'],
//       ),
//     );
//   }
// }
