import 'package:easyflow/layers/domain/entities/equipment_entity.dart';

abstract class PostEquipmentsDataSource {
  Future<EquipmentEntity> call(EquipmentEntity data);
}
