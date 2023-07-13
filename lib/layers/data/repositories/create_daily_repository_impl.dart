import 'package:easyflow/layers/data/datasources/create_daily_datasource.dart';
import 'package:easyflow/layers/domain/entities/daily_entity.dart';
import 'package:easyflow/layers/domain/repositories/create_daily_repository.dart';

class CreateDailyRepositoryImpl implements CreateDailyRepository {
  final CreateDailyDatasource _createDailyDatasource;

  CreateDailyRepositoryImpl(this._createDailyDatasource);
  @override
  Future<void> call(DailyEntity dailyEntity) async {
    return _createDailyDatasource(dailyEntity);
  }
}
