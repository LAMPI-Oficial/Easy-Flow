import 'package:easyflow/layers/domain/entities/enums/status_enum.dart';
import 'package:easyflow/layers/domain/entities/equipment_entity.dart';

import '../../../../domain/entities/representative_entity.dart';

class EquipmentController {
  Future<List<EquipmentEntity>> getEquipments() async {
    return [
      EquipmentEntity(
          date: "${DateTime.now()}", status: Status.DISAPPROVED, id: 1),
      EquipmentEntity(date: DateTime.now(), status: Status.APPROVED, id: 2),
      EquipmentEntity(date: DateTime.now(), status: Status.PENDING, id: 1),
    ];
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
