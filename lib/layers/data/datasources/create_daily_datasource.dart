import 'package:easyflow/layers/domain/entities/daily_entity.dart';

abstract class CreateDailyDatasource {
  Future<void> call(
      DailyEntity dailyEntity);
}
