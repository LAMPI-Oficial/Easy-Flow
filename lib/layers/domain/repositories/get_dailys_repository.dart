import 'package:easyflow/layers/domain/entities/daily_entity.dart';

abstract class GetDailysRepository {
  Future<List<DailyEntity>> call();
}
