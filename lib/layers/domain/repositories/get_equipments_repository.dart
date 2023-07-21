import 'package:easyflow/layers/domain/entities/equipment_entity.dart';

abstract class GetEquipmentsRepository {
  Future<List<EquipmentEntity>> call();
}
