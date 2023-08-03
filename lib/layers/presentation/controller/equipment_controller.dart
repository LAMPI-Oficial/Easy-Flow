import 'package:easyflow/layers/domain/entities/equipment_entity.dart';
import 'package:easyflow/layers/domain/exceptions/api_exception.dart';
import 'package:easyflow/layers/domain/usecases/get_equipments_usercase.dart';
import 'package:easyflow/layers/domain/usecases/post_equipments_usercase.dart';
import 'package:easyflow/layers/presentation/ui/widgets/dialogs_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../domain/entities/representative_entity.dart';

var data = DateTime.now();
var dataZerada = DateTime.utc(data.year, data.month, data.day);

class EquipmentController {
  final GetEquipmentsUseCase _getEquipmentsUseCase;
  final PostEquipmentsUseCase _postEquipmentsUseCase;

  EquipmentController(this._getEquipmentsUseCase, this._postEquipmentsUseCase);

  final formKey = GlobalKey<FormState>();
  RepresentativeEntity representative = RepresentativeEntity(
    id: 0,
    name: "",
    imageUrl: "",
    email: "",
    studyArea: "",
  );

  var firstDay = dataZerada;
  var lastDay = dataZerada.add(const Duration(days: 365));
  var requestDate = dataZerada;
  var focusedDay = dataZerada;

  var returnDate = dataZerada.add(const Duration(days: 1));
  var returnDateFocusedDay = dataZerada.add(const Duration(days: 1));
  var returnDateFirstDay = dataZerada.add(const Duration(days: 1));

  var representativeController = TextEditingController(text: "");
  var justificationTextFieldController = TextEditingController(text: "");

  Future<List<EquipmentEntity>> getEquipments() async {
    return await _getEquipmentsUseCase.call();
  }

  Future<EquipmentEntity> postRequest(EquipmentEntity data) async {
    return await _postEquipmentsUseCase.call(data);
  }

  Future<List<RepresentativeEntity>> getRepresentatives() async {
    return [
      RepresentativeEntity(
        name: 'Michael Alves Pereira',
        studyArea: 'Programação web',
        email: 'maicon159951@gmail.com',
        imageUrl: null,
        id: 1,
      ),
      RepresentativeEntity(
        name: 'Abrahao',
        studyArea: 'Programação web',
        email: 'maicon159951@gmail.com',
        imageUrl: null,
        id: 2,
      ),
    ];
  }

  requestEquipment(BuildContext context, EquipmentEntity equipment) async {
    if (formKey.currentState!.validate() &&
        returnDate.compareTo(requestDate) > 0) {
      Dialogs.loading(context);
      try {
        _postEquipmentsUseCase(equipment).then(
          (value) => context.pushReplacement('/menu'),
        );
      } on ApiException catch (e) {
        Navigator.of(context).pop();
        Dialogs.error(context, title: e.title, message: e.message);
      }
    } else {
      Dialogs.error(
        context,
        title: "Erro",
        message: "Por favor, preencha todos os dados!",
      );
    }
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
