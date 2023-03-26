import 'package:get/get.dart';

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

  String? valueDay;
  String? valueTurn;

  changeValueDay(dynamic value) {
    print(valueDay);
    valueDay = value;
    update();
    print(valueDay);
  }

  changeValueTurn(dynamic value) {
    valueTurn = value;
    update();
  }
}
