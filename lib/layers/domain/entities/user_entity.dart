import 'package:easyflow/layers/data/dto/person_dto.dart';
import 'package:easyflow/layers/domain/entities/course_entity.dart';
import 'package:easyflow/layers/domain/entities/person_entity.dart';
import 'package:easyflow/layers/domain/entities/study_area_entity.dart';

class UserEntity {
  final int id;
  final String token;
  final String login;
  final PersonEntity person;
    CourseEntity course;
  StudyAreaEntity studyArea;

  UserEntity({
    required this.id,
    required this.token,
    required this.login,
    required this.person,
        required this.course,
    required this.studyArea,
  });

}
