import 'package:easyflow/layers/domain/entities/equipment_entity.dart';
import 'package:easyflow/layers/domain/usecases/get_equipments_usercase.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/representative_entity.dart';

class EquipmentController {
  final GetEquipmentsUseCase _getEquipmentsUseCase;

  EquipmentController(this._getEquipmentsUseCase);

  final formKey = GlobalKey<FormState>();
  RepresentativeEntity? representative;

  var firstDay = DateTime.now();
  var lastDay = DateTime.utc(DateTime.now().year + 1);
  var requestDate = DateTime.now();
  var focusedDay = DateTime.now();

  var returnDate = DateTime.now();
  var returnDateFocusedDay = DateTime.now().add(const Duration(days: 1));
  var returnDateFirstDay = DateTime.now().add(const Duration(days: 1));

  var representativeController = TextEditingController(text: "");
  var justificationTextFieldController = TextEditingController();

  Future<List<EquipmentEntity>> getEquipments() async {
    return await _getEquipmentsUseCase.call();
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

  String getMonth(int month) {
    var monthsOfTheYear = {
      1: "Janeiro",
      2: "Fevereiro",
      3: "Março",
      4: "Abril",
      5: "Maio",
      6: "Junho",
      7: "Julho",
      8: "Agosto",
      9: "Setembro",
      10: "Outubro",
      11: "Novembro",
      12: "Dezembro",
    };

    return monthsOfTheYear[month] ?? "Janeiro";
  }
}
