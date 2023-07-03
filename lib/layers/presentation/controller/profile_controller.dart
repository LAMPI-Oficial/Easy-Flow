

import 'package:easyflow/layers/domain/entities/course_entity.dart';
import 'package:easyflow/layers/domain/entities/study_area_entity.dart';
import 'package:easyflow/layers/domain/usecases/get_courses_usecase.dart';
import 'package:easyflow/layers/domain/usecases/get_study_areas_usecase.dart';

class ProfileController  {
   final GetCoursesUseCase _getCoursesIdUseCase;
  final GetStudyAreasUseCase _getStudyAreasUseCase;

  ProfileController(this._getCoursesIdUseCase, this._getStudyAreasUseCase);
  Future<List<CourseEntity>> getCourses() async {
    return _getCoursesIdUseCase.call();
  }

  Future<List<StudyAreaEntity>> getStudyAreas() async {
    return _getStudyAreasUseCase.call();
  }


}
