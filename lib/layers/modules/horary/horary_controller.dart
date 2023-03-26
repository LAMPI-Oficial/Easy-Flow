import 'package:get/get.dart';

import '../../data/model/horary_model.dart';

HoraryController controller = Get.put(HoraryController());

class HoraryController extends GetxController {
  List<String> valuesDays = [
    "Segunda-feira",
    "Terça-feira",
    "Quarta-feira",
    "Quinta-feira",
    "Sexta-feira",
  ];

  List<String> valuesTurns = [
    "Manhã",
    "Tarde",
    "Noite",
  ];

  var value = "".obs;

  var valueDay = "Segunda-feira".obs;
  var valueTurn = "Manhã".obs;

  changeValueDay(dynamic value) {
    valueDay.value = value;
    update();
  }

  changeValueTurn(dynamic value) {
    valueTurn.value = value;
    update();
  }

  List<HoraryModel> objects = [
    HoraryModel(
      id: 0,
      name: "Larissa Silva",
      day: "Terça-feira",
      numTable: 1,
      turn: "Tarde",
    ),
    HoraryModel(
      id: 1,
      name: "Lucas Correa",
      day: "Segunda-feira",
      numTable: 12,
      turn: "Manhã",
    ),
    HoraryModel(
      id: 2,
      name: "Lucas Correa",
      day: "Segunda-feira",
      numTable: 12,
      turn: "Manhã",
    ),
    // HoraryModel(
    //   id: 3,
    //   name: "Ana Laura",
    //   day: "Quinta-feira",
    //   numTable: 1,
    //   turn: "Noite",
    // )
  ].obs;
}
