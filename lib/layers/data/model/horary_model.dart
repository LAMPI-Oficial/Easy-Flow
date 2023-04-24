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

  static HoraryModel fromMap(Map map) {
    return HoraryModel(
      id: map['id'],
      name: map['name'],
      numTable: map['numTable'],
      day: map['day'],
      turn: map['turn'],
    );
  }

  Map toMap() {
    return {
      'id': id,
      'name': name,
      'day': day,
      'numTable': numTable,
      'turn': turn,
    };
  }
}
