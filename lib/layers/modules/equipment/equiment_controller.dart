import 'package:get/get.dart';

class EquipmentController extends GetxController {
  DateTime focusedDay = DateTime.now();
  DateTime firstDay = DateTime.now();
  DateTime lastDay = DateTime.utc(DateTime.now().year + 1);
}
