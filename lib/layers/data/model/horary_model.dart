import 'package:get/get.dart';

class HoraryModel {
  int id;
  String name;
  int numTable;
  String day;
  String turn;

  HoraryModel({
    required this.id,
    required this.name,
    required this.day,
    required this.numTable,
    required this.turn,
  });
}
