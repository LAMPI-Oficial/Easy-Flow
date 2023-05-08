import 'package:easyflow/layers/data/model/schedule_model.dart';
import 'package:easyflow/layers/data/provider/schedule_provider.dart';
import 'package:easyflow/layers/data/repository/schedule_repository.dart';
import 'package:easyflow/layers/data/service/user_service.dart';
import 'package:get/get.dart';

class ScheduleController extends GetxController {
  final ScheduleRepository _scheduleRepository;
  final user = Get.put<UserService>(UserService());
  ScheduleController(this._scheduleRepository);
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
  RxList<ScheduleModel> schedules = <ScheduleModel>[].obs;
  getAll() {
    _scheduleRepository.getAll(user.userLogged).then((value) => schedules(value));
  }
}
