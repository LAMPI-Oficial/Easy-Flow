import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/representative_model.dart';

class EquipmentController {
  final formKey = GlobalKey<FormState>();
  var firstDay = DateTime.now();
  var lastDay = DateTime.utc(DateTime.now().year + 1);
  var requestDate = DateTime.now().obs;
  var focusedDay = DateTime.now().obs;

  var returnDate = DateTime.now().obs;
  var returnDateFocusedDay = DateTime.now().add(const Duration(days: 1)).obs;
  var returnDateFirstDay = DateTime.now().add(const Duration(days: 1)).obs;

  var justificationTextFieldController = TextEditingController();

  var requests = [].obs;
  var representatives = <String>[].obs;
  String? representative;

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

  requestEquipment(context) {
    if (formKey.currentState!.validate()) {
      context.push('/equipments');
    }
  }

  void onRequestDaySelected(DateTime selectedDay, DateTime focusedDay) {
    requestDate.value = selectedDay;
    this.focusedDay.value = focusedDay;

    returnDateFocusedDay = requestDate.value.add(const Duration(days: 1)).obs;
    returnDateFirstDay = requestDate.value.add(const Duration(days: 1)).obs;
  }

  void onReturnDaySelected(DateTime selectedDay, DateTime focusedDay) {
    returnDate.value = selectedDay;
    returnDateFocusedDay.value = focusedDay;
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
