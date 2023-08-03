import 'package:easyflow/layers/data/datasources/post_equipments_datasource.dart';
import 'package:easyflow/layers/domain/entities/equipment_entity.dart';
import 'package:easyflow/layers/domain/repositories/post_equipments_repository.dart';

class PostEquipmentsRepositoryImpl implements PostEquipmentsRepository {
  final PostEquipmentsDataSource _postEquipmentsDatasource;

  PostEquipmentsRepositoryImpl(this._postEquipmentsDatasource);

  @override
  Future<EquipmentEntity> call(EquipmentEntity data) async {
    return await _postEquipmentsDatasource(data);
  }
}
