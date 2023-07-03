import 'package:easyflow/layers/domain/entities/course_entity.dart';

abstract class GetCoursesDataSource {
  Future<List<CourseEntity>> call();
}
