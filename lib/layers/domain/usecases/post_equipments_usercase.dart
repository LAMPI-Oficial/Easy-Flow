import 'package:easyflow/layers/domain/entities/equipment_entity.dart';
import 'package:easyflow/layers/domain/repositories/post_equipments_repository.dart';

abstract class PostEquipmentsUseCase {
  Future<EquipmentEntity> call(EquipmentEntity data);
}

class PostEquipmentsUseCaseImpl implements PostEquipmentsUseCase {
  final PostEquipmentsRepository _getEquipmentsRepository;

  PostEquipmentsUseCaseImpl(this._getEquipmentsRepository);

  @override
  Future<EquipmentEntity> call(EquipmentEntity data) async {
    return _getEquipmentsRepository(data);
  }
}
