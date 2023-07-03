import 'package:easyflow/layers/data/datasources/get_study_areas_datasource.dart';
import 'package:easyflow/layers/domain/entities/study_area_entity.dart';
import 'package:easyflow/layers/domain/repositories/get_study_areas_repository.dart';

class GetStudyAreasRepositoryImpl
    implements GetStudyAreasRepository {
  final GetStudyAreasDataSource
      _getStudyAreasDataSource;

  GetStudyAreasRepositoryImpl(
      this._getStudyAreasDataSource);
  @override
  Future<List<StudyAreaEntity>> call() async {
    return _getStudyAreasDataSource();
  }
}
