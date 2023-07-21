import 'package:easyflow/layers/domain/entities/equipment_entity.dart';
import 'package:easyflow/layers/domain/usecases/get_equipments_usercase.dart';

import '../../domain/entities/representative_entity.dart';

class EquipmentController {
  final GetEquipmentsUseCase _getEquipmentsUseCase;

  EquipmentController(this._getEquipmentsUseCase);

  Future<List<EquipmentEntity>> getEquipments() async {
    return _getEquipmentsUseCase.call();
  }

  Future<List<RepresentativeEntity>> getRepresentatives() async {
    return [
      RepresentativeEntity(
          name: 'Michael Alves Pereira',
          studyArea: 'Programação web',
          email: 'maicon159951@gmail.com',
          imageUrl: null,
          id: 1),
      RepresentativeEntity(
          name: 'Abrahao',
          studyArea: 'Programação web',
          email: 'maicon159951@gmail.com',
          imageUrl: null,
          id: 2),
    ];
  }
}
