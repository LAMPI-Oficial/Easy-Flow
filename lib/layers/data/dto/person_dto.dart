import 'package:easyflow/layers/domain/entities/enums/person_type_enum.dart';
import 'package:easyflow/layers/domain/entities/person_entity.dart';

class PersonDto extends PersonEntity {
  PersonDto({
    required int id,
    required String? urlPhoto,
    required String name,
    required String email,
    required bool admin,
    required bool isRepresentative,
  }) : super(
          id: id,
          urlPhoto: urlPhoto,
          name: name,
          email: email,
          admin: admin,
          personType:
              isRepresentative ? PersonType.representative : PersonType.student,
        );

  Map<String, dynamic> toMap() => {
        "id": id,
        "urlPhoto": urlPhoto,
        "name": name,
        "email": email,
        "admin": admin,
        "representative":
            personType == PersonType.representative ? true : false,
      };

  static PersonDto fromMap(Map map) {
    return PersonDto(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      admin: map['admin'],
      isRepresentative: map['admin'],
      urlPhoto: map['url_photo'],
    );
  }
}

// import 'package:easyflow/layers/data/dto/address_dto.dart';
// import 'package:easyflow/layers/data/dto/course_dto.dart';
// import 'package:easyflow/layers/data/dto/study_area_dto.dart';
// import 'package:easyflow/layers/domain/entities/address_entity.dart';
// import 'package:easyflow/layers/domain/entities/course_entity.dart';
// import 'package:easyflow/layers/domain/entities/enums/person_type_enum.dart';
// import 'package:easyflow/layers/domain/entities/person_entity.dart';
// import 'package:easyflow/layers/domain/entities/study_area_entity.dart';

// class PersonDto extends PersonEntity {
//   PersonDto({
//     required int id,
//     required String urlPhoto,
//     required String name,
//     required String email,
//     required CourseEntity course,
//     required StudyAreaEntity studyArea,
//     required AddressEntity address,
//     required bool admin,
//     required bool isRepresentative,
//   }) : super(
//           id: id,
//           urlPhoto: urlPhoto,
//           name: name,
//           email: email,
//           course: course,
//           studyArea: studyArea,
//           address: address,
//           admin: admin,
//           personType:
//               isRepresentative ? PersonType.representative : PersonType.student,
//         );

//   Map<String, dynamic> toMap() => {
//         "id": id,
//         "urlPhoto": urlPhoto,
//         "name": name,
//         "email": email,
//         "course": CourseDto(id: course.id, name: course.name).toMap,
//         "study_area":
//             StudyAreaDto(id: studyArea.id, name: studyArea.name).toMap(),
//         "address": AddressDto(
//                 cep: address.cep,
//                 city: address.city,
//                 state: address.state,
//                 district: address.district,
//                 street: address.street,
//                 number: address.number,
//                 complement: address.complement)
//             .toMap(),
//         "admin": admin,
//         "representative":
//             personType == PersonType.representative ? true : false,
//       };

//   static PersonDto fromMap(Map map) {
//     return PersonDto(
//       id: map['id'],
//       name: map['name'],
//       email: map['email'],
//       admin: map['admin'],
//       isRepresentative: map['representative'],
//       urlPhoto: map['url_photo'],
//       address: AddressDto.fromMap(map['address']),
//       course: CourseDto.fromMap(map['course']),
//       studyArea: StudyAreaDto.fromMap(map['study_area']),
//     );
//   }
// }