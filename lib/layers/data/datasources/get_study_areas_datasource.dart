import 'package:easyflow/layers/domain/entities/study_area_entity.dart';

abstract class GetStudyAreasDataSource {
  Future<List<StudyAreaEntity>> call();
}
