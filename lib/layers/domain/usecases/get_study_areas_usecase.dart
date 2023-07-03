import 'package:easyflow/layers/domain/entities/study_area_entity.dart';
import 'package:easyflow/layers/domain/repositories/get_study_areas_repository.dart';

abstract class GetStudyAreasUseCase {
  Future<List<StudyAreaEntity>> call();
}

class GetStudyAreasUseCaseImpl
    implements GetStudyAreasUseCase {
  final GetStudyAreasRepository
      _getStudyAreasRepository;

  GetStudyAreasUseCaseImpl(
      this._getStudyAreasRepository);

  @override
  Future<List<StudyAreaEntity>> call() async {
    return _getStudyAreasRepository();
  }
}
