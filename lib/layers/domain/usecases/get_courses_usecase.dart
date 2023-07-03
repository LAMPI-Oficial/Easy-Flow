import 'package:easyflow/layers/domain/entities/course_entity.dart';
import 'package:easyflow/layers/domain/repositories/get_courses_repository.dart';

abstract class GetCoursesUseCase {
  Future<List<CourseEntity>> call();
}

class GetCoursesUseCaseImpl
    implements GetCoursesUseCase {
  final GetCoursesRepository
      _getCoursesRepository;

  GetCoursesUseCaseImpl(
      this._getCoursesRepository);

  @override
  Future<List<CourseEntity>> call() async {
    return _getCoursesRepository();
  }
}
