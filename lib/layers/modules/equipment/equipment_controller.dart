import 'package:easyflow/layers/data/model/enums/status_enum.dart';
import 'package:easyflow/layers/data/model/equipment_model.dart';

import '../../data/model/representative_model.dart';

class EquipmentController {
  Future<List<EquipmentModel>> getEquipments() async {
    return [
      EquipmentModel(date: DateTime.now(), status: Status.DISAPPROVED, id: 1),
      EquipmentModel(date: DateTime.now(), status: Status.APPROVED, id: 2),
      EquipmentModel(date: DateTime.now(), status: Status.PENDING, id: 1),
    ];
  }

  Future<List<RepresentativeModel>> getRepresentatives() async {
    return [
      RepresentativeModel(
          name: 'Michael Alves Pereira',
          area: 'Programação web',
          email: 'maicon159951@gmail.com',
          imageUrl: null,
          turn: '',
          id: 1),
      RepresentativeModel(
          name: 'Abrahao',
          area: 'Programação web',
          email: 'maicon159951@gmail.com',
          imageUrl: null,
          turn: '',
          id: 2),
    ];
  }
}
