import 'package:easyflow/layers/data/model/course_model.dart';
import 'package:easyflow/layers/data/provider/course_provider.dart';

class CourseRepository {
  final CourseProvider _courseProvider;

  CourseRepository(this._courseProvider);

  Future<List<CourseModel>> getAll() {
    return _courseProvider.getAll();
  }
}
