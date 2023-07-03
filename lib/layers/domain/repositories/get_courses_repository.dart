import 'package:easyflow/layers/domain/entities/course_entity.dart';

abstract class GetCoursesRepository {
  Future<List<CourseEntity>> call();
}
