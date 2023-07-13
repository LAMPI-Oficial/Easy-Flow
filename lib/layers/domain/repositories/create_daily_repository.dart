import 'package:easyflow/layers/domain/entities/daily_entity.dart';

abstract class CreateDailyRepository {
  Future<void> call(DailyEntity dailyEntity);
}
