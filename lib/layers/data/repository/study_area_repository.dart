import 'package:easyflow/layers/data/model/study_area_model.dart';
import 'package:easyflow/layers/data/provider/study_area_provider.dart';

class StudyAreaRepository {
  final StudyAreaProvider _studyAreaProvider;

  StudyAreaRepository(this._studyAreaProvider);

  Future<List<StudyAreaModel>> getAll() {
    return _studyAreaProvider.getAll();
  }
}
