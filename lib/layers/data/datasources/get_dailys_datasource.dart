import 'package:easyflow/layers/domain/entities/daily_entity.dart';

abstract class GetDailysDataSource {
  Future<List<DailyEntity>> call();
}
