import 'package:get/get.dart';

class HoraryController extends GetxController {
  List<String> valuesDays = [
    "Seg",
    "Ter",
    "Qua",
    "Qui",
    "Sex",
  ];

  List<String> valuesTurns = [
    "Manhã",
    "Tarde",
    "Noite",
  ];

  String? valueDay;
  String? valueTurn;

  changeValueDay(String? value) {
    valueDay = value!;
    update();
  }

  changeValueTurn(String? value) {
    valueTurn = value!;
    update();
  }
}
