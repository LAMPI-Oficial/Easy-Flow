import 'package:easyflow/layers/data/datasources/get_courses_datasource.dart';
import 'package:easyflow/layers/domain/entities/course_entity.dart';
import 'package:easyflow/layers/domain/repositories/get_courses_repository.dart';

class GetCoursesRepositoryImpl
    implements GetCoursesRepository {
  final GetCoursesDataSource
      _getCoursesDataSource;

  GetCoursesRepositoryImpl(
      this._getCoursesDataSource);
  @override
  Future<List<CourseEntity>> call() async {
    return _getCoursesDataSource();
  }
}
