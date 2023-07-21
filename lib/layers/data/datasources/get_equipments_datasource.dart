import 'package:easyflow/layers/domain/entities/equipment_entity.dart';

abstract class GetEquipmentsDataSource {
  Future<List<EquipmentEntity>> call();
}
