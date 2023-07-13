import 'package:easyflow/layers/domain/entities/daily_entity.dart';
import 'package:easyflow/layers/domain/repositories/create_daily_repository.dart';

abstract class CreateDailyUseCase {
  Future<void> call(DailyEntity dailyEntity);
}

class CreateDailyUseCaseImpl implements CreateDailyUseCase {
  final CreateDailyRepository _createDailyRepository;

  CreateDailyUseCaseImpl(this._createDailyRepository);
  @override
  Future<void> call(
      DailyEntity dailyEntity) async {
    return _createDailyRepository(dailyEntity);
  }
}
