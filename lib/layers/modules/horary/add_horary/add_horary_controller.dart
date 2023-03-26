import 'package:get/get.dart';

class AddHoraryController extends GetxController {
  bool selectedSeg = false;
  bool selectedTer = false;
  bool selectedQua = false;
  bool selectedQui = false;
  bool selectedSex = false;

  int turnSeg = 3;
  int turnTer = 3;
  int turnQua = 3;
  int turnQui = 3;
  int turnSex = 3;

  int selectedTable = 21;

  final texts = ["Manhã", "Tarde", "Noite"];

  changeIsSelected(bool selected, int aux) {
    switch (aux) {
      case 0:
        selectedSeg = selected;
        break;
      case 1:
        selectedTer = selected;
        break;
      case 2:
        selectedQua = selected;
        break;
      case 3:
        selectedQui = selected;
        break;
      case 4:
        selectedSex = selected;
        break;
    }
    update();
  }

  selected(int index, int aux) {
    switch (aux) {
      case 0:
        turnSeg = index;
        break;
      case 1:
        turnTer = index;
        break;
      case 2:
        turnQua = index;
        break;
      case 3:
        turnQui = index;
        break;
      case 4:
        turnSex = index;
        break;
    }
    update();
  }

  selectTable(int index) {
    selectedTable = index;
    update();
  }
}
