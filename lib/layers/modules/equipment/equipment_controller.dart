import 'package:get/get.dart';

class EquipmentController extends GetxController {
  var firstDay = DateTime.now();
  var lastDay = DateTime.utc(DateTime.now().year + 1);
  var requestDate = DateTime.now().obs;
  var focusedDay = DateTime.now().obs;

  var returnDate = DateTime.now().obs;
  var returnDateFocusedDay = DateTime.now().add(const Duration(days: 1)).obs;
  var returnDateFirstDay = DateTime.now().add(const Duration(days: 1)).obs;

  void onRequestDaySelected(DateTime selectedDay, DateTime focusedDay) {
    requestDate.value = selectedDay;
    this.focusedDay.value = focusedDay;
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
