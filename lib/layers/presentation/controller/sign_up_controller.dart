import 'package:easyflow/layers/domain/entities/course_entity.dart';
import 'package:easyflow/layers/domain/entities/create_person_entity.dart';
import 'package:easyflow/layers/domain/entities/study_area_entity.dart';
import 'package:easyflow/layers/domain/usecases/create_person_usecase.dart';
import 'package:easyflow/layers/domain/usecases/get_courses_usecase.dart';
import 'package:easyflow/layers/domain/usecases/get_study_areas_usecase.dart';

class SignUpController {
  final GetCoursesUseCase _getCoursesIdUseCase;
  final GetStudyAreasUseCase _getStudyAreasUseCase;
  final CreatePersonUseCase _createPersonUseCase;
  SignUpController(this._getCoursesIdUseCase, this._getStudyAreasUseCase,
      this._createPersonUseCase);

  CourseEntity? course;
  StudyAreaEntity? studyArea;

  Future<List<CourseEntity>> getCourses() async {
    return _getCoursesIdUseCase.call();
  }

  Future<List<StudyAreaEntity>> getStudyAreas() async {
    return _getStudyAreasUseCase.call();
  }

  signUp(CreatePersonEntity createPerson) async {
    _createPersonUseCase.call(createPerson);
  }
}
