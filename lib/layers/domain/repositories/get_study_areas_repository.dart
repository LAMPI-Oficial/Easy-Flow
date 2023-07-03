import 'package:easyflow/layers/domain/entities/study_area_entity.dart';

abstract class GetStudyAreasRepository {
  Future<List<StudyAreaEntity>> call();
}
