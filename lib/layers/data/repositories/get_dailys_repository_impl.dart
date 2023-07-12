import 'package:easyflow/layers/data/datasources/get_dailys_datasource.dart';
import 'package:easyflow/layers/domain/entities/daily_entity.dart';
import 'package:easyflow/layers/domain/repositories/get_dailys_repository.dart';

class GetDailysRepositoryImpl
    implements GetDailysRepository {
  final GetDailysDataSource
      _getDailysDataSource;

  GetDailysRepositoryImpl(
      this._getDailysDataSource);
  @override
  Future<List<DailyEntity>> call() async {
    return _getDailysDataSource();
  }
}
