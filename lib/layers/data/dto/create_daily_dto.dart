import 'package:easyflow/layers/domain/entities/daily_entity.dart';

class CreateDailyRequestDto {
  DailyEntity dailyEntity;

  CreateDailyRequestDto({
    required this.dailyEntity,
  });

  Map toMap() {
    return {
      'id': dailyEntity.id,
      'description': dailyEntity.description,
      'created_in': "${dailyEntity.date}",
    };
  }
}
