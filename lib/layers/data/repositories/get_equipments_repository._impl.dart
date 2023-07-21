import 'package:easyflow/layers/data/datasources/get_equipments_datasource.dart';
import 'package:easyflow/layers/domain/entities/equipment_entity.dart';
import 'package:easyflow/layers/domain/repositories/get_equipments_repository.dart';

class GetEquipmentsRepositoryImpl implements GetEquipmentsRepository {
  final GetEquipmentsDataSource _getEquipmentsDataSource;

  GetEquipmentsRepositoryImpl(this._getEquipmentsDataSource);

  @override
  Future<List<EquipmentEntity>> call() async {
    return _getEquipmentsDataSource();
  }
}
