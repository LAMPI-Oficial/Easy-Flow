import 'package:get/get.dart';

class AddHoraryController extends GetxController {
  bool isSelected = false;
  int selectedSeg = 3;
  int selectedTer = 3;
  int selectedQua = 3;
  int selectedQui = 3;
  int selectedSex = 3;

  final texts = ["Manhã", "Tarde", "Noite"];

  // changeIsSelected() {
  //   isSelected = !isSelected;
  //   update();
  // }

  selected(int index, int aux) {
    switch (aux) {
      case 0:
        selectedSeg = index;
        break;
      case 1:
        selectedTer = index;
        break;
      case 2:
        selectedQua = index;
        break;
      case 3:
        selectedQui = index;
        break;
      case 4:
        selectedSex = index;
        break;
    }
    update();
  }
}
