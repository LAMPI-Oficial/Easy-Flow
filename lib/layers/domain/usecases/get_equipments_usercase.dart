import 'package:easyflow/layers/domain/entities/equipment_entity.dart';
import 'package:easyflow/layers/domain/repositories/get_equipments_repository.dart';

abstract class GetEquipmentsUseCase {
  Future<List<EquipmentEntity>> call();
}

class GetEquipmentsUseCaseImpl implements GetEquipmentsUseCase {
  final GetEquipmentsRepository _getEquipmentsRepository;

  GetEquipmentsUseCaseImpl(this._getEquipmentsRepository);

  @override
  Future<List<EquipmentEntity>> call() async {
    return _getEquipmentsRepository();
  }
}
