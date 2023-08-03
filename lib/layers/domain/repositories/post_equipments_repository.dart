import 'package:easyflow/layers/domain/entities/equipment_entity.dart';

abstract class PostEquipmentsRepository {
  Future<EquipmentEntity> call(EquipmentEntity data);
}
